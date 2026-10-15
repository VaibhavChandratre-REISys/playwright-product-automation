@DataTableEnhanced @ComponentSanity @EnhancedDataTableDetail @ComponentSanity1
Feature: Data Table Enhanced Scenarios
Business Need: to ensure that the Data Table Enhanced of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @499346 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM- User Interface Behavior Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size           | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination          | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size          | 5                 | ApiGeneratedId:2 |
      | Flex Table            | Enable Help                | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Total Records Count | true              | ApiGeneratedId:4 |
      | Flex Table            | Enable Filter              | true              | ApiGeneratedId:5 |
      | Flex Table            | Enable Quick Search        | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Auto Index          | false             | ApiGeneratedId:7 |
      | Flex Table            | Disable Menu               | false             | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size           | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Pagination          | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Grid:General     | Default Page Size          | 5             | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Help                | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Total Records Count | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Filter              | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Quick Search        | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Auto Index          | true          | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Disable Menu               | false         | DataTableEnhanceProgramContacts | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    Then I see "Contacts" page block displayed
    Then I see auto index symbol "#" for tableid "---program:-:contactsTableId---"
    Then I softly see quick search inside table id "---program:-:contactsTableId---"
    Then I see Advance Filter box is displayed inside table id "---program:-:contactsTableId---" in flex table
    Then I see "Menu" action is displayed at the "---program:-:contactsTableId---" modal
    Then I see Total Records count "Total Records:" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5" inside table id "---program:-:contactsTableId---"
    Then I see pagination is displayed with "Page 1 of" inside table id "---program:-:contactsTableId---"
    Then I see "Menu" action is displayed at the "---program:-:contactsTableId---" modal
    And I pause execution for "5" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName    | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Disable Menu | true          | DataTableEnhanceProgramContacts | Name                      |                            |
    And I refresh the page
    Then I do not see "Menu" action is displayed at the "---program:-:contactsTableId---" modal

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499349 @checkmanualyforhelptext @wip
  Scenario Outline: 3.0- Data Table Enhanced- PM- Information, SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                                               | filterId         |
      | Flex Table            | Header             | Contacts                                                        | ApiGeneratedId:0 |
      | Flex Table            | Header Help Text   | State or funding organization contacts for applicants to refer. | ApiGeneratedId:1 |
      | Flex Table:General    | Header Instruction |                                                                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName          | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Header             | Contacts Test                                                   | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Header Help Text   | State or funding organization contacts for applicants to refer. | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction                              | DataTableEnhanceProgramContacts | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "6" seconds
    When I click modal button "Close"
    Then I see "Contacts Test" page block displayed
    Then I see "Test Automation Header Instruction" shown as header instruction text
    And I pause execution for "4" seconds
    And I hovering mouse on help text icon inside "Contacts" for flex table column
    And I pause execution for "3" seconds
    Then I softly see "State or funding organization contacts for applicants to refer." shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499353
  Scenario Outline: 3.0- Data Table Enhanced- PM- Export Setting, Record Selection
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue            | filterId         |
      | Flex Table            | Enable Export (PDF)              | true                         | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV)        | true                         | ApiGeneratedId:1 |
      | Flex Table:General    | Enable Record Selection          | true                         | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | left                         | ApiGeneratedId:3 |
      | Flex Table            | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Export (PDF)              | true                         | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV)        | true                         | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Enable Record Selection          | true                         | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | left                         | DataTableEnhanceProgramContacts | Name                      |                            |
      | Flex Table:General    | Display Field Names              | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "2" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly see "Contacts" page block displayed
    Then I softly see record selection is displayed for tableId "---program:-:contactsTableId---"
    Then I see "Menu" action is displayed at the "---program:-:contactsTableId---" modal
    And I click on "Menu" button inside table id "---program:-:contactsTableId---"
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499355 @checkhelptextmanuallyforbasesalryfield @InternalUser @wip
  Scenario Outline: 3.0- Data Table Enhanced- PM- Numeric Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active             | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table List       | Enable Row Grouping   | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Enable Sub Total      | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Enable Over All Total | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Hide Grouping Column  | false                        | ApiGeneratedId:5 |
      | Flex Table List       | Formula               |                              | ApiGeneratedId:6 |
      | Flex Table List       | Sub Total Label       |                              | ApiGeneratedId:7 |
      | Flex Table List       | Help Text             | Help Data                    | ApiGeneratedId:8 |
      | Flex Table List       | Field Label Override  |                              | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName             | fieldNewValue                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active             | true                                                                                | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names   | ProjectRole__c,Contact__c,Contact__r.Email,BaseSalary__c,Contact__r.Organization__c | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping   | true                                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Enable Sub Total      | true                                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Enable Over All Total | true                                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Hide Grouping Column  | false                                                                               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Formula               | {SavedValue:Formula}                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Sub Total Label       | Sub Base Salary                                                                     | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Help Text             | Help Data                                                                           | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
      | Flex Table List              | Field Label Override  | Base Salary                                                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly see row grouping for field "BaseSalary__c" with group header "Base Salary : -" and total value "$0.00"
    Then I softly see "Sub Base Salary-Base Salary : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    When I hovering mouse on help text icon inside page block detail for invisible element "BaseSalary"
    And I pause execution for "2" seconds
    Then I softly see "Help Data" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499486 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:4  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:6  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                         | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | false                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Contact__c}               |
      | Flex Table List              | Hide Grouping Column | false                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Contact__c}               |
      | Flex Table List              | Help Text            | Help Name                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Contact__c}               |
      | Flex Table List              | Field Label Override | Name                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Contact__c}               |
      | Flex Table List              | Enable Row Grouping  | true                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c}           |
      | Flex Table List              | Hide Grouping Column | false                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c}           |
      | Flex Table List              | Help Text            | Help Project Role            | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c}           |
      | Flex Table List              | Field Label Override | Project Role                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c}           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "8" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #LookupFiled
    #Then I softly see row grouping for field "Contact__c" with group header "Base Salary : $0" and total value "$0.00"
    Then I see column header "Name" displayed in tableId "---program:-:contactsTableId---"
#    And I hovering mouse on help text icon inside "Name" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Name" shown as help text
    #PicklistField
    Then I softly see "Project Role :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Project Role" displayed in tableId "---program:-:contactsTableId---"
#    And I hovering mouse on help text icon inside "Project Role" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Project Role" shown as help text
 #   And I hovering mouse on help text icon inside "Name" for flex table column
#    And I pause execution for "2" seconds
 #   Then I softly see "Help Name" shown as help text
    #PicklistField
    Then I softly see "Project Role :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Project Role" displayed in tableId "---program:-:contactsTableId---"
 #   And I hovering mouse on help text icon inside "Project Role" for flex table column
#    And I pause execution for "2" seconds
   # Then I softly see "Help Project Role" shown as help text

  @499490 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Checkbox, Email, URL Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:10 |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:11 |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                                                                | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c,IsKeyContact__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:IsKeyContact__c}          |
      | Flex Table List              | Hide Grouping Column | true                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:IsKeyContact__c}          |
      | Flex Table List              | Help Text            |                                                                     | DataTableEnhanceProgramContacts | Name                      | {SavedValue:IsKeyContact__c}          |
      | Flex Table List              | Field Label Override | Is Key Contact                                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:IsKeyContact__c}          |
      | Flex Table List              | Enable Row Grouping  | true                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Email}                    |
      | Flex Table List              | Hide Grouping Column | false                                                               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Email}                    |
      | Flex Table List              | Help Text            | Help Email                                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Email}                    |
      | Flex Table List              | Field Label Override | Email Test                                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Email}                    |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c,IsKeyContact__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:URL__c}                   |
      | Flex Table List              | Hide Grouping Column | false                                                               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:URL__c}                   |
      | Flex Table List              | Help Text            | Help URL                                                            | DataTableEnhanceProgramContacts | Name                      | {SavedValue:URL__c}                   |
      | Flex Table List              | Field Label Override | URL                                                                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:URL__c}                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "6" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #CheckBoxField
    Then I softly see "Is Key Contact :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I softly do not see column header "Is Key Contact" displayed in tableId "---program:-:contactsTableId---"
    #EmailField
    Then I softly see "Email Test : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Email Test" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "Email"
#    And I pause execution for "2" seconds
#    Then I softly see "Help Email" shown as help text
     #URLFiled
    Then I softly see "URL : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "URL" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "URL"
#    And I pause execution for "2" seconds
#    Then I softly see "Help URL" shown as help text

  @499492 @InternalUser
  Scenario Outline:3.0- Data Table Enhanced- PM-  Standard and Text Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                              | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},Name | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                              | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Hide Grouping Column | false                             | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Help Text            | Help Key Contacts Name            | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Field Label Override | Key Contacts Name                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #Standard/TextDataTypeField
    Then I softly see "Key Contacts Name :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Key Contacts Name" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "Key Contacts Name"
#    And I pause execution for "2" seconds
#    Then I softly see "Help Key Contacts Name" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499493 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Date and Date & Time Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active            | true                                                  | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal}   |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},Date__c,Date_And_Time__c | DataTableEnhanceProgramContacts |                           |                                         |
      | Flex Table List              | Enable Row Grouping  | true                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Date__c}                    |
      | Flex Table List              | Hide Grouping Column | false                                                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Date__c}                    |
      | Flex Table List              | Help Text            | Help Date                                             | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Date__c}                    |
      | Flex Table List              | Field Label Override | Date                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Date__c}                    |
      | Flex Table List              | Enable Row Grouping  | true                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ContactPM-Date_And_Time__c} |
      | Flex Table List              | Hide Grouping Column | true                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ContactPM-Date_And_Time__c} |
      | Flex Table List              | Help Text            |                                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ContactPM-Date_And_Time__c} |
      | Flex Table List              | Field Label Override | Date/Time                                             | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ContactPM-Date_And_Time__c} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},Date__c,Date_And_Time__c | DataTableEnhanceProgramContacts |                           |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "3" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #DateField
    Then I softly see "Date : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Date" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "Date"
#    And I pause execution for "2" seconds
#    Then I softly see "Help Date" shown as help text
    #Date/TimeField
    Then I softly see "Date/Time : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I softly do not see column header "Date/Time" displayed in tableId "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499494
  Scenario: 3.0- Data Table Enhanced- PM-  Phone and Email Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                                         | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Phone_Number__c}          |
      | Flex Table List              | Hide Grouping Column | false                                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Phone_Number__c}          |
      | Flex Table List              | Help Text            | Help Phone Number                            | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Phone_Number__c}          |
      | Flex Table List              | Field Label Override | Phone Number                                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Phone_Number__c}          |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #PhonenumberField
    Then I softly see "Phone Number : -" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Phone Number" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "Phone Number"
#    And I pause execution for "2" seconds
#    Then I softly see "Help Phone Number" shown as help text

  @499495
  Scenario: 3.0- Data Table Enhanced- PM-  Formula and Multi-Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                                                       | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},City__c,Test_Multipicklist__c | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:City__c}                  |
      | Flex Table List              | Hide Grouping Column | false                                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:City__c}                  |
      | Flex Table List              | Help Text            | Help City                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:City__c}                  |
      | Flex Table List              | Field Label Override | City                                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:City__c}                  |
      | Flex Table List              | Enable Row Grouping  | false                                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Test_Multipicklist__c}    |
      | Flex Table List              | Hide Grouping Column | false                                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Test_Multipicklist__c}    |
      | Flex Table List              | Help Text            | Help Multipicklist                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Test_Multipicklist__c}    |
      | Flex Table List              | Field Label Override | Multipicklist                                              | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Test_Multipicklist__c}    |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},City__c,Test_Multipicklist__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "2" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #FormulaField
    Then I softly see "City :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "City" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "City"
#    And I pause execution for "2" seconds
#    Then I softly see "Help City" shown as help text
     #MultipicklistField-rowgrouping is NA for this
    Then I softly see column header "Multipicklist" displayed in tableId "---program:-:contactsTableId---"
#    When I hovering mouse on help text icon inside page block detail "Multipicklist"
#    And I pause execution for "2" seconds
#    Then I softly see "Help Multipicklist" shown as help text

###################### Quick Search For All Data Types ############################
  @499820 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Quick Search Scenarios- Numeric Data Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table            | Enable Quick Search | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                         | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table:General           | Enable Quick Search | true                         | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
   # When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "6" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | BaseSalary |
      | {SavedValue:EXE Username} | 34500.56   |
    And I pause execution for "5" seconds
    #Search Exact Match
    And I perform quick search for "34500.56" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search Partial Match
    And I perform quick search for "500" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search Decimal Value
    And I perform quick search for ".5" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search with Incorrect Data
    And I perform quick search for "089" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search with Extra Spaces
    And I perform quick search for "   1 23" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search with Special Characters
    And I perform quick search for "!#%" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Search with alphanumeric value
    And I perform quick search for "123ahkl" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @499834 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Quick Search Scenarios- Picklist, Lookup field Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                         | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "4" seconds
#    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
#    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role         |
      | {SavedValue:PM Username} | Authorized Signatory |
    And I pause execution for "5" seconds
   #LookupFiled-Search Exact Match
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #LookupFiled-Search Partial Match
    And I perform quick search for "Vrushali" in "---program:-:contactsTableId---" panel
    Then I softly see value "Vrushali Newase" for title "Name" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #LookupFiled-Search with Incorrect Data
    And I perform quick search for "SARAn" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #LookupFiled-Search with Extra Spaces
    And I perform quick search for "   Davi d" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #LookupFiled-Search with Special Characters
    And I perform quick search for "!#%" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #LookupFiled-Search with alphanumeric value
    And I perform quick search for "123Sarah" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #PicklistField-Search Exact Match
    And I perform quick search for "Authorized Signatory" in "---program:-:contactsTableId---" panel
    Then I softly see value "Authorized Signatory" for title "Project Role" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
#   #PicklistField-Search Partial Match #Not Supported
#    And I perform quick search for "Signatory" in "---program:-:contactsTableId---" panel
#    Then I softly see value "Authorized Signatory" for title "Project Role" inside table "---program:-:contactsTableId---"
#    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "5" seconds
    #PicklistField-Search with Incorrect Data
    And I perform quick search for "Signatury" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #PicklistField-Search with Extra Spaces
    And I perform quick search for "   Sign n" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #PicklistField-Search with Special Characters
    And I perform quick search for "!#%@" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #PicklistField-Search with alphanumeric value
    And I perform quick search for "123Auth" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @500124 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Quick Search Scenarios- Checkbox, Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},URL__c,IsKeyContact__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "5" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Email        |
      | {SavedValue:PM Username} | vr@gmail.com |
    #Email-Search Exact Match
    And I perform quick search for "vr@gmail.com" in "---program:-:contactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search Partial Match
    And I perform quick search for "vr" in "---program:-:contactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Incorrect Data
    And I perform quick search for "vrn" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Extra Spaces
    And I perform quick search for "   vr 34" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Special Characters
    And I perform quick search for "r@gma" in "---program:-:contactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #EmailField-Search with alphanumeric value
    And I perform quick search for "son777" in "---program:-:contactsTableId---" panel
    Then I softly see value "david345@gmail.com" for title "Email" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
      #URL-Search Exact Match
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL               |
      | {SavedValue:PM Username} | www.microsoft.com |
    And I pause execution for "5" seconds
    And I perform quick search for "www.microsoft.com" in "---program:-:contactsTableId---" panel
    Then I softly see value "www.microsoft.com" for title "URL" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #URL-Search Partial Match
    And I perform quick search for "microsoft" in "---program:-:contactsTableId---" panel
    Then I softly see value "www.microsoft.com" for title "URL" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #URL-Search with Incorrect Data
    And I perform quick search for "wwww." in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with Extra Spaces
    And I perform quick search for "   micro n" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with Special Characters
    And I perform quick search for "!#%@" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with alphanumeric value
    And I perform quick search for "123micro" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    #ChekboxField Search Exact Match
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I pause execution for "5" seconds
    And I perform quick search for "True" in "---program:-:contactsTableId---" panel
    Then I softly see value "True" for title "Is Key Contact" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Checkbox-Search Partial Match
    And I perform quick search for "fal" in "---program:-:contactsTableId---" panel
    Then I softly see value "false" for title "Is Key Contact" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Checkbox-Search with Incorrect Data
    And I perform quick search for "truee" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #CheckboxField-Search with Extra Spaces
    And I perform quick search for "   false n" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @500131 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Quick Search Scenarios- Standard field and Text data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                            | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},CreatedBy,NSFID__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I pause execution for "7" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "5" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    #StandardField-Search Exact Match
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    Then I softly see value "{SavedValue:PM Username}" for title "Created By ID" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search Partial Match
    And I perform quick search for "mation PM" in "---program:-:contactsTableId---" panel
    Then I softly see value "{SavedValue:PM Username}" for title "Created By ID" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Incorrect Data
    And I perform quick search for "automatied" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Extra Spaces
    And I perform quick search for "   matio n" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Special Characters
    And I perform quick search for "!#%@" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with alphanumeric value
    And I perform quick search for "123auto" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    #TextField - Search Exact
    And I perform quick search for "{SavedValue:PM Username}1" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | NSF ID    |
      | {SavedValue:PM Username}1 | Test Data |
    And I pause execution for "5" seconds
    And I perform quick search for "Test Data" in "---program:-:contactsTableId---" panel
    Then I softly see value "Test Data" for title "NSF ID" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search Partial Match
    And I perform quick search for "st Data" in "---program:-:contactsTableId---" panel
    Then I softly see value "Test Data" for title "NSF ID" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with Incorrect Data
    And I perform quick search for "tested" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with Extra Spaces
    And I perform quick search for "   test n" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with Special Characters
    And I perform quick search for "!#%@" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with alphanumeric value
    And I perform quick search for "123data" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @500135 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM-  Quick Search Scenarios-  Date and Date & Time data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                  | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Date__c,Date_And_Time__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "4" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Date      |
      | {SavedValue:PM Username} | 3/28/2025 |
    And I pause execution for "5" seconds
    #DateField-Search Exact Match
    And I perform quick search for "3/28/2025" in "---program:-:contactsTableId---" panel
    Then I softly see value "3/28/2025" for title "Date" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #DateField-Search Partial Match
    And I perform quick search for "3/" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #DateField-Search with Incorrect Data
    And I perform quick search for "3/30/2029" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #DateNTimeField-Search Partial Match
    And I perform quick search for "3/28/2026" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #DateNTimeField-Search with Incorrect Data
    And I perform quick search for "05:43 PM" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @#DateNTimeField-SearchExactMatch @InternalUser @wip
  Scenario Outline: if failed check this manually #DateNTimeField-Search Exact Match - if failed check this manually
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                  | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Date__c,Date_And_Time__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "4" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I select value inside table "---program:-:contactsTableId---" is "All"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:contactsTableId---" panel
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Date And Time              |
      | {SavedValue:PM Username} | {Date:dd/MM/yyyy hh:mm:ss} |
    And I pause execution for "5" seconds
    And I perform quick search for "{Date:dd/MM/yyyy hh:mm:ss}" in "---program:-:contactsTableId---" panel
    Then I softly see value "{Date:dd/MM/yyyy hh:mm:ss}" for title "Date And Time" inside table "---program:-:contactsTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

################ Data Table Enahnced - Actions ######################
  @500656 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM- Actions- Edit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue            | filterId         |
    #  | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Action Name              | Edit                         | ApiGeneratedId:1 |
      | Flex Table Action     | Standard Action          | Edit                         | ApiGeneratedId:2 |
      | Flex Table Action     | Location                 | Row                          | ApiGeneratedId:3 |
      | Flex Table Action     | Single Row Edit Behavior | Inline                       | ApiGeneratedId:4 |
      | Flex Table Action     | Action Behavior          | EditRecord                   | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names      | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
   #   | Flex Table Action     | Is Active                | true          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Action Name              | Edit                         | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Standard Action          | Edit                         | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Location                 | Row                          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Single Row Edit Behavior | Inline                       | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior          | EditRecord                   | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table:General    | Display Field Names      | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly can see row level action button "View" against "{SavedValue:PM Username}" in flex table with id "---program:-:contactsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---program:-:contactsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:PM Username}" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I see field "ProjectRole__c" is editable
    Then I see field "BaseSalary__c" is editable

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @500657 @InternalUser
  Scenario:  3.0- Data Table Enhanced- PM- Actions- View
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
    #  | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Action Name         | View                         | ApiGeneratedId:1 |
      | Flex Table Action     | Standard Action     | View                         | ApiGeneratedId:2 |
      | Flex Table Action     | Location            | Row                          | ApiGeneratedId:3 |
      | Flex Table Action     | Where To Open ?     | SameWindow                   | ApiGeneratedId:4 |
      | Flex Table Action     | Action Behavior     | OpenURL                      | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
   #   | Flex Table Action     | Is Active                | true          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Action Name         | View                         | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Standard Action     | View                         | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Location            | Row                          | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Where To Open ?     | SameWindow                   | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Action Behavior     | OpenURL                      | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly can see row level action button "View" against "{SavedValue:PM Username}" in flex table with id "---program:-:contactsTableId---"
    #Where to Open- Same Window
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see "Contact Information" page block displayed
    And I pause execution for "5" seconds
    And I click on back arrow
    #Where to Open- New Tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | NewTab        | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | DataTableEnhanceProgramContacts | Name                      | View                       |
    And I refresh the page
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Contact Information" page block displayed
    And I switch to parent tab
    And I pause execution for "4" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal         | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | DataTableEnhanceProgramContacts | Name                      | View                       |
    And I refresh the page
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    #Where to Open- Modal
    Then I see "Create Contact" opens in overLay window
    #Then I softly see "Contact Information" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | NewWindow     | DataTableEnhanceProgramContacts | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | DataTableEnhanceProgramContacts | Name                      | View                       |
    And I refresh the page
    #Where to Open- New Window
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see new window is opened
    And I switch to tab number "1"
    Then I softly see "Contact Information" page block displayed

  @500658 @InternalUser
  Scenario:  3.0- Data Table Enhanced- PM- Actions- Remove
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table Action     | Action Name         | Remove                       | ApiGeneratedId:0 |
      | Flex Table Action     | Standard Action     | Delete                       | ApiGeneratedId:1 |
      | Flex Table Action     | Location            | Row                          | ApiGeneratedId:2 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid             | ApiGeneratedId:3 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action Name         | Remove                       | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table Action     | Standard Action     | Delete                       | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table Action     | Location            | Row                          | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid             | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FD Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly can see row level action button "Remove" against "{SavedValue:PM Username}" in flex table with id "---program:-:contactsTableId---"
    When I click on "Remove" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without accept popup
    Then I softly see "Continue" button is displayed on confirmation box
    Then I softly see confirmation box with body "This action will remove the record, Are you sure you want to remove?" is displayed
    And I click "OK" on modal confirmation box
#    Then I softly see the following message in the page details :
#      | Record removed successfully. |
    Then I see table is refreshing
    And I pause execution for "5" seconds
    #Refresh the entire page
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid             | ApiGeneratedId:4 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Refresh Behavior    | Refresh the entire page      | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click "OK" on modal confirmation box
    Then I see entire page is refreshing
    And I pause execution for "5" seconds
    #Refresh all flextables
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid             | ApiGeneratedId:4 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Refresh Behavior    | Refresh all flextables       | DataTableEnhanceProgramContacts | Name                      | Remove                     |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click "OK" on modal confirmation box
    Then I see table is refreshing

  @500659 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Actions- New
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
     # | Flex Table Action     | Action Name         | New                              | ApiGeneratedId:0 |
     # | Flex Table Action     | Standard Action  | New               | ApiGeneratedId:1 |
      | Flex Table Action     | Location         | Top               | ApiGeneratedId:2 |
      | Flex Table Action     | Modal Title      | Create Contact    | ApiGeneratedId:3 |
      | Flex Table Action     | Button Help Text | New               | ApiGeneratedId:4 |
      | Flex Table Action     | Where To Open ?  | Modal             | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
     # | Flex Table Action     | Action Name         | New                              | DataTableEnhanceProgramContacts | Name                      | New                     |
    #  | Flex Table Action     | Standard Action  | New            | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Location         | Top            | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Modal Title      | Create Contact | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Button Help Text | New            | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Where To Open ?  | Modal          | DataTableEnhanceProgramContacts | Name                      | New                        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Create Contact" opens in overLay window

################### Advance Filter For All Data Type ##########
  @500166 @InternalUser
  Scenario:  3.0- Data Table Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},NumberOfPersonnel__c,Percentage__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "Automation PO" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FD Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Number Of Personnel | BaseSalary | Percentage |
      | {SavedValue:PM Username}  | 9                   | 345        | 90         |
      | {SavedValue:EXE Username} | 23                  | 1500       | 12         |
      | Automation PO             | 6                   | 100        | 67         |
      | {SavedValue:FD Username}  | 5                   | 1200       | 34         |
      | {SavedValue:FO Username}  | 4                   | 90         | 45         |
    #Number Field
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Number Of Personnel | equals to | 5 |
    Then I softly see value "5" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Number Of Personnel | greater than | 5 |
    Then I softly see value "9" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "2" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Number Of Personnel | less than | 5 |
#    Then I softly see value "4" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Number Of Personnel | greater than or equal to | 9 |
#    Then I softly see value "9" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    Then I softly see value "23" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Number Of Personnel | less than or equal to | 9 |
#    Then I softly see value "9" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    Then I softly see value "5" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
#    #Currency Field - Base Salary
#    And I pause execution for "5" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | BaseSalary | equals to | 345 |
#    Then I softly see value "$345.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | BaseSalary | greater than | 345 |
#    Then I softly see value "$1,500.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "2" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | BaseSalary | less than | 345 |
#    Then I softly see value "$100.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | BaseSalary | greater than or equal to | 1200 |
#    Then I softly see value "$1,200.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    Then I softly see value "$1,500.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | BaseSalary | less than or equal to | 345 |
#    Then I softly see value "$345.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    Then I softly see value "$100.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
#    #Percentage Field - Percentage
#    And I pause execution for "5" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Percentage | equals to | 45 |
#    Then I softly see value "45%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Percentage | greater than | 45 |
#    Then I softly see value "90%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "2" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Percentage | less than | 45 |
#    Then I softly see value "12%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Percentage | greater than or equal to | 67 |
#    Then I softly see value "67%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    Then I softly see value "90%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Percentage | less than or equal to | 67 |
#    Then I softly see value "67%" for title "Percentage" inside table "---program:-:contactsTableId---"
#    Then I softly see value "34%" for title "Percentage" inside table "---program:-:contactsTableId---"

  @500431 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Advance Filter- Text Data Types
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active           | false                        | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active           | false                        | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
      | Flex Table                               | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}      |
      | Flex Table:General                       | Display Field Names | {SavedValue:ProgramTableDFN},ProjectGoals__c,Authorization__c,Abbreviation__c | Programs              |                           |                                          |
    And I delete the record "{SavedValue:Automation Runtime Internal Program}" from the object "Program"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "as kd" into field "Abbreviation__c"
    And I enter value "Authorization Runtime Focus Area" into field "Authorization__c"
    And I enter value "Vrushali Table Enhanced Check Goals" into field "ProjectGoals__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    #Text Field
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Abbreviation | contains | kd |
    Then I softly see value "as kd" for title "Abbreviation" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Abbreviation | does not contains | tk |
    Then I softly do not see value "tk" for title "Abbreviation" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Abbreviation | starts with | as |
    Then I softly see value "as kd" for title "Abbreviation" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Abbreviation | ends with | kd |
    Then I softly see value "as kd" for title "Abbreviation" inside table "---program:-:programsTableId---"

  @textarea @InternalUser @checkmanually @wip
  Scenario: Advance Filter Text Area, Long Text Area - Check this manually
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active           | false                        | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active           | false                        | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
      | Flex Table                               | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}      |
      | Flex Table:General                       | Display Field Names | {SavedValue:ProgramTableDFN},ProjectGoals__c,Authorization__c,Abbreviation__c | Programs              |                           |                                          |
    And I delete the record "{SavedValue:Automation Runtime Internal Program}" from the object "Program"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "as kd" into field "Abbreviation__c"
    And I enter value "Authorization Runtime Focus Area" into field "Authorization__c"
    And I enter value "Vrushali Table Enhanced Check Goals" into field "ProjectGoals__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    #Text Field
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
#      And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
#        | Authorization | contains | Focus |
#      Then I softly see value "Authorization Runtime Focus Area" for title "Authorization" inside table "---program:-:programsTableId---"
#      When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
#      And I pause execution for "3" seconds
#      And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
#        | Authorization | does not contains | tk |
#      Then I softly do not see value "tk" for title "Authorization" inside table "---program:-:programsTableId---"
#      When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
#      And I pause execution for "3" seconds
#      And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
#        | Authorization | starts with | Authorization |
#      Then I softly see value "Authorization Runtime Focus Area" for title "Authorization" inside table "---program:-:programsTableId---"
#      When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
#      And I pause execution for "3" seconds
#      And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
#        | Authorization | ends with | Focus Area |
#      Then I softly see value "Authorization Runtime Focus Area" for title "Authorization" inside table "---program:-:programsTableId---"
#      When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
#      And I pause execution for "3" seconds
    #Long Text Area Field
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | X_Project Goals | contains | Vrushali |
    Then I softly see value "Vrushali Table Enhanced Check Goals" for title "Project Goals" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | X_Project Goals | does not contains | tk |
    Then I softly do not see value "tk" for title "Project Goals" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | X_Project Goals | starts with | Vrushali |
    Then I softly see value "Vrushali Table Enhanced Check Goals" for title "Project Goals" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | X_Project Goals | ends with | Goals |
    Then I softly see value "Vrushali Table Enhanced Check Goals" for title "Project Goals" inside table "---program:-:programsTableId---"

  @500453 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Advance Filter- Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},ContactEmail__c,URL__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Overview" sub tab
    #Email Field
    And I pause execution for "5" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FD Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Contact Email    | URL                           |
      | {SavedValue:PM Username}  | vrush@gmail.com  | www.google.com                |
      | {SavedValue:EXE Username} | exe@yopmail.com  | frwklwcaut.sandbox.lightning. |
      | {SavedValue:FD Username}  | fd@reisystems.in | https://app.keka.com/         |
      | {SavedValue:FO Username}  | fo@reisystems.in | https://jenkins.reisys.com/   |
    And I pause execution for "4" seconds
    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Contact Email | contains | com |
    Then I softly see value "vrush@gmail.com" for title "Contact Email" inside table "---program:-:contactsTableId---"
    Then I softly see value "exe@yopmail.com" for title "Contact Email" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Contact Email | does not contains | com |
    Then I softly see value "fd@reisystems.in" for title "Contact Email" inside table "---program:-:contactsTableId---"
    Then I softly see value "fo@outlook.co.in" for title "Contact Email" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Contact Email | starts with | vru |
    Then I softly do not see value "fd@reisystems.in" for title "Contact Email" inside table "---program:-:contactsTableId---"
    Then I softly see value "vrush@gmail.com" for title "Contact Email" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Contact Email | ends with | in |
    Then I softly see value "fd@reisystems.in" for title "Contact Email" inside table "---program:-:contactsTableId---"
    Then I softly do not see value "vrush@gmail.com" for title "Contact Email" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    #URL field
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | URL | contains | .com |
    Then I softly see value "www.google.com" for title "URL" inside table "---program:-:contactsTableId---"
    Then I softly see value "https://app.keka.com/" for title "URL" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | URL | does not contains | com |
    Then I softly see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | URL | starts with | https |
    Then I softly do not see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---program:-:contactsTableId---"
    Then I softly see value "https://jenkins.reisys.com/" for title "URL" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | URL | ends with | .lightning. |
    Then I softly see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---program:-:contactsTableId---"
    Then I softly do not see value "https://jenkins.reisys.com/" for title "URL" inside table "---program:-:contactsTableId---"

  @500438 @checkboxfieldcheckmanuallyforadvancefilter @InternalUser @wip
  Scenario: 3.0- Data Table Enhanced- PM- Advance Filter- Checkbox, Picklist, Lookup Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},IsKeyContact__c,CreatedBy | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Overview" sub tab
    #Checkbox Field
    And I pause execution for "5" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I select value inside table "---program:-:associateContactsTableId---" is "All"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FD Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role         | Is Key Contact |
      | {SavedValue:PM Username}  | Authorized Signatory | Checked        |
      | {SavedValue:EXE Username} | Ebiz POC             |                |
      | {SavedValue:FD Username}  | Fiscal Contact       | Checked        |
      | {SavedValue:FO Username}  | Program Manager      |                |
    And I pause execution for "4" seconds
#    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Is Key Contact | equals to | Checked |
#    Then I softly see value "True" for title "Is Key Contact" inside table "---program:-:contactsTableId---"
#    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
#    And I pause execution for "3" seconds
#    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
#      | Is Key Contact | not equals to |  |
#    Then I softly see value "False" for title "Key Contacts Name" inside table "---program:-:contactsTableId---"
    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
    #Picklist Field
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Project Role | equals to | Authorized Signatory |
    Then I softly see value "Authorized Signatory" for title "Project Role" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Project Role | not equals to | Other |
    Then I softly do not see value "Other" for title "Project Role" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    #lookup field
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Created By ID | equals to | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Created By ID" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Created By ID | not equals to | Automation ADMIN |
    Then I softly do not see value "Automation ADMIN" for title "Created By ID" inside table "---program:-:contactsTableId---"


############## Hide Expression Json - Base Salary ##########
  @501246 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryUserType | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                      | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "Base Salary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryUserTypeApplicant | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                               | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryUserTypeInReviewer | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    And I pause execution for "6" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserTypeInternal | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                   | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserTypeApplicant | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                    | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserTypeReviewer | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                   | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501250 @InternalUser
  Scenario:3.0- Data Table Enhanced- PM- Hide Expression Json- Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInContextEdit | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                           | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "Base Salary" displayed in tableId "---program:-:contactsTableId---"
    When I navigate to "Overview" sub tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInContextEdit | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                              | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInContextView | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                           | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly do not see column header "Base Salary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInContextView | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                              | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501236 @InternalUser
  Scenario:  3.0- Data Table Enhanced- PM- Hide Expression Json- $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryEquals$UserFirstName | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotEquals$UserFirstName | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                     | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501248 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Expression Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    | <defaultconfig>              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | <setupconfig1>               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    | <defaultconfig>              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | <setupconfig2>               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

    Examples:
      | User | defaultconfig | setupconfig1                                           | setupconfig2                                              |
      | PM   |               | govgrants_config:HideColumnJsonBaseSalaryINProfilePM   | govgrants_config:HideColumnJsonBaseSalaryNOTINProfilePM   |
      | EXE1 |               | govgrants_config:HideColumnJsonBaseSalaryINProfileEXE1 | govgrants_config:HideColumnJsonBaseSalaryNOTINProfileEXE1 |
      | EXE  |               | govgrants_config:HideColumnJsonBaseSalaryINProfileEXE  | govgrants_config:HideColumnJsonBaseSalaryNOTINProfileEXE  |

  @501251 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- User App
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGrantor | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                     | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserAppStateAsGrantor | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                        | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGrantee | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                     | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserAppStateAsGrantee | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                        | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501772 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryCombinationOfProfileContextUserApp | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                                | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501983 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- 3Groups(Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryCombinationOfProfileContextUserApp | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                                                | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501254 @InternalUser
  Scenario:3.0- Data Table Enhanced- PM- Hide Expression Json- Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInQueuePM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                       | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInQueuePM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                          | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501989 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- 2Groups(Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalary2GroupsCobination | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                               | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501223 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldStatusCreatedEqualsPM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                        | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                | Grantor State Program           | Name                      | {SavedValue:Status}                     |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #Equals-Status-Created
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldStatusCreatedNotEqualsPM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                           | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                   | Grantor State Program           | Name                      | {SavedValue:Status}        |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #LessThanEquals-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtLessThanEquals | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                          | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                  | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #GreaterThanEquals-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                            | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtGreaterThanEquals | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                             | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                                     | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #LessThan-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtLessThan | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                    | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
     #GreaterThan-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtGreaterThan | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                       | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                               | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "4001" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

  @501223_1 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Hide Expression Json- Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFocusAreaReqNo | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                 | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                         | Grantor State Program           | Name                      | {SavedValue:FocusAreaReq}  |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #In-FocusAreaRequired-No
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #NotIn-FocusAreaRequired-YesNo
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldFocusAreaReqNoYes | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                    | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                            | Grantor State Program           | Name                      | {SavedValue:FocusAreaReq}  |
    And I refresh the page
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"
    #Contains-Type-EmergencyGrants
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName           | fieldNewValue                                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table List                          | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryFieldTypeEmergencyGrants | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}     |
      | Flex Table:General                       | Display Field Names | {SavedValue:ContactTableDFN}                                      | DataTableEnhanceProgramContacts |                           |                                |
      | Page Block Config:Page Block Rule Detail | Is Active           | true                                                              | Grantor State Program           | Name                      | {SavedValue:PicklistTypeField} |
    And I refresh the page
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "Emergency Grants" into field "Type__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly do not see column header "BaseSalary" displayed in tableId "---program:-:contactsTableId---"

################### Read Only Cell Json and Read Only Column Json - Suite Id - 502442 #########
  @502433 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Column Json- $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List       | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ReadOnlyColumnJsonBaseSalary$User | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ContactTableDFN}                       | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "BaseSalary__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJNotEqualsBaseSalary$User | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "BaseSalary__c" is in edit mode

  @502434 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Column Json- User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List       | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryInApplicantUserType | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ContactTableDFN}                       | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    #Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see field "BaseSalary__c" is not editable
    #UserType-Applicant
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryNotInApplicantUserType | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "BaseSalary__c" is not editable
    #UserType-InternalUser
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryInInternalUserType | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "BaseSalary__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryNotInInternalUserType | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "BaseSalary__c" is in edit mode
    #UserType-Reviewer
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryInReviewerUserTypePO | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "BaseSalary__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCLBaseSalaryNotInReviewerUserTypeEXE | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "BaseSalary__c" is in edit mode

  @502435 @InternalUser
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List       | Read Only Column Json | <defaultconfig>              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | <setupconfig1>               | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "BaseSalary__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | <setupconfig2> | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "BaseSalary__c" is in edit mode

    Examples:
      | User | defaultconfig | setupconfig1                                 | setupconfig2                                    |
      | PM   |               | govgrants_config:ROCLBaseSalaryInProfilePM   | govgrants_config:ROCLBaseSalaryNotInProfilePM   |
      | EXE1 |               | govgrants_config:ROCLBaseSalaryInProfileEXE1 | govgrants_config:ROCLBaseSalaryNotInProfileEXE1 |
      | EXE  |               | govgrants_config:ROCLBaseSalaryInProfileEXE  | govgrants_config:ROCLBaseSalaryNotInProfileEXE  |

  @502437 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Column Json- Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List       | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleInContextEdit | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ContactTableDFN}                  | DataTableEnhanceProgramContacts |                           |                             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "ProjectRole__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleNotInContextEdit | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode
    And I pause execution for "3" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleInContextView | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "ProjectRole__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleNotInContextView | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode

  @502439 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Column Json- User App
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List       | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleInUserAppGrantor | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ContactTableDFN}                     | DataTableEnhanceProgramContacts |                           |                             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "ProjectRole__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleNotInUserAppGrantor | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode
    And I pause execution for "3" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    #User App - State As Grantee
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleInUserAppGrantee | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleNotInUserAppGrantee | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field inside table "ProjectRole__c" not in edit mode
    #User App - Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleInUserAppRecipient | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Read Only Column Json | govgrants_config:ROCJProjectRoleNotInUserAppRecipient | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field inside table "ProjectRole__c" not in edit mode

  @502441 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Column Json- Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:ROCJProjectRoleInQueuePM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}              | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field "ProjectRole__c" is not editable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:ROCJProjectRoleNotInQueuePM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN}                 | DataTableEnhanceProgramContacts |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "ProjectRole__c" is in edit mode

  @502430 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Cell Json- Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldStatusCreatedEqualsPM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                        | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                                | Grantor State Program           | Name                      | {SavedValue:Status}        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #Equals-Status-Created
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldStatusCreatedNotEqualsPM | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                           | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                                   | Grantor State Program           | Name                      | {SavedValue:Status}        |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #LessThanEquals-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtLessThanEquals | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                          | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                                  | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #GreaterThanEquals-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                            | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtGreaterThanEquals | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                             | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                                     | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #LessThan-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtLessThan | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                    | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #GreaterThan-FundedAmount-4000
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFundedAmtGreaterThan | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}              |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                       | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                               | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I enter value "4001" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field inside table "BaseSalary__c" not in edit mode

  @502430_1 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Read Only Cell Json- Field
    #In-FocusAreaRequired-No
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFocusAreaReqNo | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                 | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                         | Grantor State Program           | Name                      | {SavedValue:FocusAreaReq}  |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field inside table "BaseSalary__c" not in edit mode
    #NotIn-FocusAreaRequired-YesNo
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldFocusAreaReqNoYes | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c} |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                    | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                            | Grantor State Program           | Name                      | {SavedValue:FocusAreaReq}  |
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see fields "BaseSalary__c" is in edit mode
    #Contains-Type-EmergencyGrants
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue            | filterId         |
      | Flex Table List                          | Read Only Column Json |                              | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names   | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue                                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table List                          | Read Only Column Json | govgrants_config:HideColumnJsonBaseSalaryFieldTypeEmergencyGrants | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BaseSalary__c}     |
      | Flex Table:General                       | Display Field Names   | {SavedValue:ContactTableDFN}                                      | DataTableEnhanceProgramContacts |                           |                                |
      | Page Block Config:Page Block Rule Detail | Is Active             | true                                                              | Grantor State Program           | Name                      | {SavedValue:PicklistTypeField} |
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Emergency Grants" into field "Type__c"
    And I click on "Save" in the page details
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field inside table "BaseSalary__c" not in edit mode

  @500452 @checkmanuallyfordateandtimrfield @InternalUser @wip
  Scenario: 3.0- Data Table Enhanced- PM- Advance Filter- Date and Date & Time data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Date__c,Date_And_Time__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Overview" sub tab
    #Checkbox Field
    And I pause execution for "5" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FD Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:FO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Date      |
      | {SavedValue:PM Username}  | 5/19/2025 |
      | {SavedValue:EXE Username} | 5/25/2027 |
      | {SavedValue:FD Username}  | 4/15/2025 |
    And I pause execution for "4" seconds
    #Date Field
    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Date | equals to | May 19, 2025 |
    Then I softly see value "5/19/2025" for title "Date" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Date | greater than | May 19, 2025 |
    Then I softly see value "5/25/2027" for title "Date" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Date | less than | May 19, 2025 |
    Then I softly see value "4/15/2025" for title "Date" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Date | greater than or equal to | May 25, 2027 |
    Then I softly see value "5/25/2027" for title "Date" inside table "---program:-:contactsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Date | less than or equal to | Apr 15, 2025 |
    Then I softly see value "4/15/2025" for title "Date" inside table "---program:-:contactsTableId---"

  @501958 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- List View Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue              | filterId         |
      | Flex Table List       | Label          | Internal Programs - My Records | ApiGeneratedId:0 |
      | Flex Table List       | Is Master View | true                           | ApiGeneratedId:1 |
      | Flex Table List       | Active ?       | true                           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName      | fieldNewValue                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Label          | Internal Programs - My Records | Programs           | Name                      | FLV-5607                   |
      | Flex Table List       | Is Master View | true                           | Programs           | Name                      | FLV-5607                   |
      | Flex Table List       | Active ?       | true                           | Programs           | Name                      | FLV-5607                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - My Records"
    Then I softly see list view "Internal Programs - My Records" in table

##################### SPI3 ##########################

  @549698 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - User Interface Behavior Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size           | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination          | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size          | 5                 | ApiGeneratedId:2 |
      | Flex Table            | Enable Help                | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Total Records Count | true              | ApiGeneratedId:4 |
      | Flex Table            | Enable Filter              | true              | ApiGeneratedId:5 |
      | Flex Table            | Enable Quick Search        | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Auto Index          | false             | ApiGeneratedId:7 |
      | Flex Table            | Disable Menu               | false             | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size           | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Pagination          | true          | AppContact         | Name                      |                            |
      | Flex Grid:General     | Default Page Size          | 5             | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Help                | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Total Records Count | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Filter              | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Quick Search        | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Auto Index          | true          | AppContact         | Name                      |                            |
      | Flex Table:General    | Disable Menu               | false         | AppContact         | Name                      |                            |
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
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I see "Contacts" page block displayed
    Then I see auto index symbol "#" for tableid "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see quick search inside table id "---applicationIntake:-:applicationContactsTableId---"
    Then I see Advance Filter box is displayed inside table id "---applicationIntake:-:applicationContactsTableId---" in flex table
    Then I see "Menu" action is displayed at the "---applicationIntake:-:applicationContactsTableId---" modal
    Then I see Total Records count "Total Records:" in table name "---applicationIntake:-:applicationContactsTableId---"
    Then I see table contains "Showing 1 to 5" inside table id "---applicationIntake:-:applicationContactsTableId---"
    Then I see pagination is displayed with "Page 1 of" inside table id "---applicationIntake:-:applicationContactsTableId---"
    Then I see "Menu" action is displayed at the "---applicationIntake:-:applicationContactsTableId---" modal
    And I pause execution for "5" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName    | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Disable Menu | true          | AppContact         | Name                      |                            |
    And I refresh the page
    Then I do not see "Menu" action is displayed at the "---applicationIntake:-:applicationContactsTableId---" modal

  @549808 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Numeric Data Types (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | BaseSalary__c,NumberOfPersonnel__c,Percentage__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I perform quick search for "Automation PO" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Number Of Personnel | BaseSalary | Percentage |
      | {SavedValue:PM Username}   | 9                   | 345        | 90         |
      | {SavedValue:EXE1 Username} | 23                  | 1500       | 12         |
      | Automation PO              | 6                   | 100        | 67         |
      | {SavedValue:FD Username}   | 5                   | 1200       | 34         |
      | {SavedValue:FO Username}   | 4                   |            | 45         |
    #Number Field
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Number Of Personnel | equals to | 5 |
    Then I softly see value "5" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Number Of Personnel | greater than | 5 |
    Then I softly see value "9" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "2" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Number Of Personnel | less than | 5 |
    Then I softly see value "4" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Number Of Personnel | greater than or equal to | 9 |
    Then I softly see value "9" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "23" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Number Of Personnel | less than or equal to | 9 |
    Then I softly see value "9" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "5" for title "Number Of Personnel" inside table "---applicationIntake:-:applicationContactsTableId---"
    #Currency Field - Base Salary
    And I pause execution for "5" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | BaseSalary | equals to | 345 |
    Then I softly see value "$345.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | BaseSalary | greater than | 345 |
    Then I softly see value "$1,500.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "2" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | BaseSalary | less than | 345 |
    Then I softly see value "$100.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | BaseSalary | greater than or equal to | 1200 |
    Then I softly see value "$1,200.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "$1,500.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | BaseSalary | less than or equal to | 345 |
    Then I softly see value "$345.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "$100.00" for title "BaseSalary" inside table "---applicationIntake:-:applicationContactsTableId---"
    #Percentage Field - Percentage
    And I pause execution for "5" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Percentage | equals to | 45 |
    Then I softly see value "45%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Percentage | greater than | 45 |
    Then I softly see value "90%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "2" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Percentage | less than | 45 |
    Then I softly see value "12%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Percentage | greater than or equal to | 67 |
    Then I softly see value "67%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "90%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Percentage | less than or equal to | 67 |
    Then I softly see value "67%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "34%" for title "Percentage" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549804 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Email, URL, Phone, Formula (Text) & Reference data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                          | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},ContactEmail__c,URL__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Contact Email    | URL                           |
      | {SavedValue:PM Username}   | vrush@gmail.com  | www.google.com                |
      | {SavedValue:EXE1 Username} | exe@yopmail.com  | frwklwcaut.sandbox.lightning. |
      | {SavedValue:FD Username}   | fd@reisystems.in | https://app.keka.com/         |
      | {SavedValue:FO Username}   | fo@reisystems.in | https://jenkins.reisys.com/   |
    And I pause execution for "4" seconds
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Contact Email | contains | com |
    Then I softly see value "vrush@gmail.com" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "exe@yopmail.com" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Contact Email | does not contains | com |
    Then I softly see value "fd@reisystems.in" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Contact Email | starts with | vru |
    Then I softly do not see value "fd@reisystems.in" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "vrush@gmail.com" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Contact Email | ends with | in |
    Then I softly see value "fd@reisystems.in" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see value "vrush@gmail.com" for title "Contact Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #URL field
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | URL | contains | .com |
    Then I softly see value "www.google.com" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "https://app.keka.com/" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | URL | does not contains | com |
    Then I softly see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | URL | starts with | https |
    Then I softly do not see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "https://jenkins.reisys.com/" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | URL | ends with | .lightning. |
    Then I softly see value "frwklwcaut.sandbox.lightning." for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see value "https://jenkins.reisys.com/" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549804_1 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Phone, Formula (Text) & Reference data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},Phone_Number__c,State__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Phone Number |
      | {SavedValue:PM Username}   | 6754839      |
      | {SavedValue:EXE1 Username} | 123456       |
      | {SavedValue:FD Username}   | 7654309      |
      | {SavedValue:FO Username}   | 4501111      |
    And I pause execution for "4" seconds
    #PhoneNumber Field
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Phone Number | contains | 1234 |
    Then I softly see value "123456" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Phone Number | does not contains | 1234 |
    Then I softly see value "6754839" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Phone Number | starts with | 450 |
    Then I softly do not see value "7654309" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "4501111" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Phone Number | ends with | 111 |
    Then I softly see value "4501111" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see value "6754839" for title "Phone Number" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Formula Text field
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | State | contains | AK |
    Then I softly see value "AK" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | State | does not contains | AK |
    Then I softly see value "VA" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | State | starts with | I |
    Then I softly do not see value "VA" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "IN" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | State | ends with | A |
    Then I softly see value "VA" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549804_2 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Reference data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I pause execution for "4" seconds
    #PhoneNumber Field
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Email | contains | automationpm |
    Then I softly see value "automationpm@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Email | does not contains | automationspi31@yopmail.com |
    Then I softly do not see value "automationspi31@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Email | starts with | test |
    Then I softly do not see value "automationspi31@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "test@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Email | ends with | gmail.com |
    Then I softly see value "automationpm@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see value "test@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549806 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Picklist, Lookup/Standard Data Types(OwnerId)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},Owner | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role         |
      | {SavedValue:PM Username}   | Authorized Signatory |
      | {SavedValue:EXE1 Username} | Ebiz POC             |
      | {SavedValue:FD Username}   | Fiscal Contact       |
      | {SavedValue:FO Username}   | Grants Administrator |
    And I pause execution for "4" seconds
    #Piclist Field
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Project Role | equals to | Authorized Signatory |
    Then I softly see value "Authorized Signatory" for title "Project Role" against the value "{SavedValue:PM Username}" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Project Role | not equals to | Fiscal Contact |
    Then I softly see value "Authorized Signatory" for title "Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see value "Fiscal Contact" for title "Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Lookup/Standard field
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Owner ID | equals to | Automation SPI3 |
    Then I softly see value "Automation SPI3" for title "Owner ID" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Owner ID | not equals to | Automation SPI3 |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549806_1 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Multiselect Picklist, Checkbox
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},Test_Multipicklist__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Test Multipicklist | Is Key Contact |
      | {SavedValue:PM Username}   | Test1              | Checked        |
      | {SavedValue:EXE1 Username} | Test1              |                |
      | {SavedValue:FD Username}   | Test1;Test3        |                |
      | {SavedValue:FO Username}   | Test1;Test3;Test4  |                |
    And I pause execution for "4" seconds
    #MultiSelect Picklist Field
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Test Multipicklist | includes | Test1 |
    Then I softly see value "Test1;Test2" for title "Test Multipicklist" against the value "{SavedValue:FO Username}" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Test Multipicklist | excludes | Test2 |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Checkbox field
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Is Key Contact | equals to | Checked |
    Then I softly see value "True" for title "Is Key Contact" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Is Key Contact | not equals to | Unchecked |
    Then I softly see value "False" for title "Is Key Contact" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549699 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Information
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                                               | filterId         |
      | Flex Table            | Header             | Contacts                                                        | ApiGeneratedId:0 |
      | Flex Table            | Header Help Text   | State or funding organization contacts for applicants to refer. | ApiGeneratedId:1 |
      | Flex Table:General    | Header Instruction |                                                                 | ApiGeneratedId:2 |
      | Flex Table            | Enable Auto Index  | true                                                            | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName          | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Header             | Contacts Test                                                   | AppContact         | Name                      |                            |
      | Flex Table:General    | Header Help Text   | State or funding organization contacts for applicants to refer. | AppContact         | Name                      |                            |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction                              | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Auto Index  | true                                                            | AppContact         | Name                      |                            |
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
    And I pause execution for "3" seconds
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "6" seconds
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly see "Contacts" page block displayed
    Then I see "Test Automation Header Instruction" shown as header instruction text
#    When I hovering mouse on help text icon inside page block detail "Contacts"
#    And I pause execution for "4" seconds
#    Then I softly see "State or funding organization contacts for applicants to refer." shown as help text
    Then I see auto index symbol "#" for tableid "---applicationIntake:-:applicationContactsTableId---"
    Then I see sequence of column "#" is in correct order inside table "---applicationIntake:-:applicationContactsTableId---" with startvalue "1"

  @549747 @spidatatable @wip
  Scenario: 3.0- Data Table Enhanced- SPI - Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Show Link as Text    | false                           | ApiGeneratedId:6  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
      | Flex Table List       | Show Link as Text    | false                           | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI}  |
      | Flex Table:General           | Display Field Names  | State__c,Name,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                   |
      | Flex Table List              | Enable Row Grouping  | true                                          | AppContact                | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List              | Hide Grouping Column | false                                         | AppContact                | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List              | Help Text            | Help State                                    | AppContact                | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List              | Field Label Override | State                                         | AppContact                | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List              | Show Link as Text    | true                                          | AppContact                | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List              | Enable Row Grouping  | true                                          | AppContact                | Name                      | {SavedValue:Name_SPI}             |
      | Flex Table List              | Hide Grouping Column | false                                         | AppContact                | Name                      | {SavedValue:Name_SPI}             |
      | Flex Table List              | Help Text            | Help Standard                                 | AppContact                | Name                      | {SavedValue:Name_SPI}             |
      | Flex Table List              | Field Label Override | Name                                          | AppContact                | Name                      | {SavedValue:Name_SPI}             |
      | Flex Table List              | Show Link as Text    | true                                          | AppContact                | Name                      | {SavedValue:Name_SPI}             |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #Standard Field
    Then I softly see "Name :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Name" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Name" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Name" shown as help text
    Then I softly do not see hyperlink at column value "IN" inside "---program:-:reviewStepTableId---" table
    #Formula Text Field
    Then I softly see "State :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "State" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help State" shown as help text
    Then I softly do not see hyperlink at column value "Automation SPI3" inside "---aaplicationIntake:-:reviewStepTableId---" table

  @549740 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Checkbox, Phone Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                            | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names  | {SavedValue:SPIContactTableDFN},Phone_Number__c | AppContact                |                           |                                  |
      | Flex Table List              | Enable Row Grouping  | true                                            | AppContact                | Name                      | {SavedValue:Phone_Number__c_SPI} |
      | Flex Table List              | Hide Grouping Column | false                                           | AppContact                | Name                      | {SavedValue:Phone_Number__c_SPI} |
      | Flex Table List              | Help Text            | Help Phone Number                               | AppContact                | Name                      | {SavedValue:Phone_Number__c_SPI} |
      | Flex Table List              | Field Label Override | Phone Number                                    | AppContact                | Name                      | {SavedValue:Phone_Number__c_SPI} |
      | Flex Table List              | Enable Row Grouping  | true                                            | AppContact                | Name                      | {SavedValue:IsKeyContact__c_SPI} |
      | Flex Table List              | Hide Grouping Column | false                                           | AppContact                | Name                      | {SavedValue:IsKeyContact__c_SPI} |
      | Flex Table List              | Help Text            | Help Cotact                                     | AppContact                | Name                      | {SavedValue:IsKeyContact__c_SPI} |
      | Flex Table List              | Field Label Override | Is Key Contact                                  | AppContact                | Name                      | {SavedValue:IsKeyContact__c_SPI} |
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
    And I pause execution for "3" seconds
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #Checkbox Field
    Then I softly see "Is Key Contact :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Is Key Contact" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Is Key Contact" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Name" shown as help text
    #Phone Number Field
    Then I softly see "Phone Number :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Phone Number" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Phone Number" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help State" shown as help text
    Then I softly do not see hyperlink at column value "Automation SPI3" inside "---program:-:reviewStepTableId---" table

  @549741 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Multi-Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2 |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active            | true                                                  | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI}       |
      | Flex Table:General           | Display Field Names  | {SavedValue:SPIContactTableDFN},Test_Multipicklist__c | AppContact                |                           |                                        |
      | Flex Table List              | Enable Row Grouping  | true                                                  | AppContact                | Name                      | {SavedValue:Test_Multipicklist__c_SPI} |
      | Flex Table List              | Hide Grouping Column | false                                                 | AppContact                | Name                      | {SavedValue:Test_Multipicklist__c_SPI} |
      | Flex Table List              | Help Text            | Help Test Multipicklist                               | AppContact                | Name                      | {SavedValue:Test_Multipicklist__c_SPI} |
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
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #Multiselect Picklist Field
    Then I softly see "Test Multipicklist :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Test Multipicklist" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Test Multipicklist" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Test Multipicklist" shown as help text

  @549742 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI -  Date and Date & Time Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                                     | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI}  |
      | Flex Table:General           | Display Field Names  | Date__c,Date_And_Time__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                   |
      | Flex Table List              | Enable Row Grouping  | true                                                     | AppContact                | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List              | Hide Grouping Column | false                                                    | AppContact                | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List              | Help Text            | Help Date                                                | AppContact                | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List              | Field Label Override | Date                                                     | AppContact                | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List              | Enable Row Grouping  | true                                                     | AppContact                | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List              | Hide Grouping Column | false                                                    | AppContact                | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List              | Help Text            | Help Date And Time                                       | AppContact                | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List              | Field Label Override | Date And Time                                            | AppContact                | Name                      | {SavedValue:Date_And_Time__c_SPI} |
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
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #Date Field
    Then I softly see "Date :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Date" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Date" shown as help text
    #Date And Time Field
    Then I softly see "Date And Time :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Date And Time" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Date And Time" shown as help text

  @549743 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Email, URL & Reference Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names  | URL__c,ContactEmail__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                  |
      | Flex Table List              | Enable Row Grouping  | true                                                   | AppContact                | Name                      | {SavedValue:URL__c_SPI}          |
      | Flex Table List              | Hide Grouping Column | false                                                  | AppContact                | Name                      | {SavedValue:URL__c_SPI}          |
      | Flex Table List              | Help Text            | Help URL                                               | AppContact                | Name                      | {SavedValue:URL__c_SPI}          |
      | Flex Table List              | Field Label Override | URL                                                    | AppContact                | Name                      | {SavedValue:URL__c_SPI}          |
      | Flex Table List              | Enable Row Grouping  | true                                                   | AppContact                | Name                      | {SavedValue:ContactEmail__c}     |
      | Flex Table List              | Hide Grouping Column | false                                                  | AppContact                | Name                      | {SavedValue:ContactEmail__c}     |
      | Flex Table List              | Help Text            | Help Contact Email                                     | AppContact                | Name                      | {SavedValue:ContactEmail__c}     |
      | Flex Table List              | Field Label Override | Contact Email                                          | AppContact                | Name                      | {SavedValue:ContactEmail__c}     |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---applicationIntake:-:applicationAssociateTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #URL Field
    Then I softly see "URL :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "URL" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help URL" shown as help text
    #Email Field
    Then I softly see "Contact Email :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Contact Email" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Contact Email" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Contact Email" shown as help text

  @549744 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                            | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names  | {SavedValue:SPIContactTableDFN} | AppContact                |                           |                                  |
      | Flex Table List              | Enable Row Grouping  | true                            | AppContact                | Name                      | {SavedValue:Contact__c_SPI}      |
      | Flex Table List              | Hide Grouping Column | false                           | AppContact                | Name                      | {SavedValue:Contact__c_SPI}      |
      | Flex Table List              | Help Text            | Help Name                       | AppContact                | Name                      | {SavedValue:Contact__c_SPI}      |
      | Flex Table List              | Field Label Override | Name                            | AppContact                | Name                      | {SavedValue:Contact__c_SPI}      |
      | Flex Table List              | Enable Row Grouping  | true                            | AppContact                | Name                      | {SavedValue:ProjectRole__c_SPI}  |
      | Flex Table List              | Hide Grouping Column | false                           | AppContact                | Name                      | {SavedValue:ProjectRole__c_SPI}  |
      | Flex Table List              | Help Text            | Help Project Role               | AppContact                | Name                      | {SavedValue:ProjectRole__c_SPI}  |
      | Flex Table List              | Field Label Override | Project Role                    | AppContact                | Name                      | {SavedValue:ProjectRole__c_SPI}  |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    #Lookup Field
    Then I softly see "Name :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Name" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Name" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Name" shown as help text
    #Picklist Field
    Then I softly see "Project Role :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Project Role" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Project Role" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Project Role" shown as help text

  @549745 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2 |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7 |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                                                             | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI}      |
      | Flex Table:General           | Display Field Names  | OtherProjectRole__c,Text_Area__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                                             | AppContact                | Name                      | {SavedValue:OtherProjectRole__c_Text} |
      | Flex Table List              | Hide Grouping Column | false                                                            | AppContact                | Name                      | {SavedValue:OtherProjectRole__c_Text} |
      | Flex Table List              | Help Text            | Help Other Project Role                                          | AppContact                | Name                      | {SavedValue:OtherProjectRole__c_Text} |
      | Flex Table List              | Field Label Override | Other Project Role                                               | AppContact                | Name                      | {SavedValue:OtherProjectRole__c_Text} |
      | Flex Table List              | Enable Row Grouping  | true                                                             | AppContact                | Name                      | {SavedValue:Text_Area__c}             |
      | Flex Table List              | Hide Grouping Column | false                                                            | AppContact                | Name                      | {SavedValue:Text_Area__c}             |
      | Flex Table List              | Help Text            | Help Text area                                                   | AppContact                | Name                      | {SavedValue:Text_Area__c}             |
      | Flex Table List              | Field Label Override | Text area                                                        | AppContact                | Name                      | {SavedValue:Text_Area__c}             |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #Text Field
    Then I softly see "Other Project Role :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Other Project Role" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Other Project Role" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Other Project Role" shown as help text
    #Text Area Field
    Then I softly see "Text Area :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Text Area" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Text Area" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Text Area" shown as help text

  @549745_1 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Text Data Type Fields (Long Text Area & Rich Text Area)- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names  | Long_Text_Area__c,Rich_Text_Area__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                  |
      | Flex Table List              | Enable Row Grouping  | true                                                                | AppContact                | Name                      | {SavedValue:Long_Text_Area__c}   |
      | Flex Table List              | Hide Grouping Column | false                                                               | AppContact                | Name                      | {SavedValue:Long_Text_Area__c}   |
      | Flex Table List              | Help Text            | Help Long Text area                                                 | AppContact                | Name                      | {SavedValue:Long_Text_Area__c}   |
      | Flex Table List              | Field Label Override | Long Text area                                                      | AppContact                | Name                      | {SavedValue:Long_Text_Area__c}   |
      | Flex Table List              | Enable Row Grouping  | true                                                                | AppContact                | Name                      | {SavedValue:Rich_Text_Area__c}   |
      | Flex Table List              | Hide Grouping Column | false                                                               | AppContact                | Name                      | {SavedValue:Rich_Text_Area__c}   |
      | Flex Table List              | Help Text            | Help Rich Text area                                                 | AppContact                | Name                      | {SavedValue:Rich_Text_Area__c}   |
      | Flex Table List              | Field Label Override | Rich Text area                                                      | AppContact                | Name                      | {SavedValue:Rich_Text_Area__c}   |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #Long Text Area Field
    Then I softly see "Long Text Area :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Long Text Area" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Long Text Area" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Long Text Area" shown as help text
    #Rich Text Area Field
    Then I softly see "Rich Text Area :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Rich Text Area" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I hovering mouse on help text icon inside "Rich Text Area" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Rich Text Area" shown as help text

  @549746 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Numeric Data Type Fields (Number, Currency & Percent) - Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId          |
      | Page Block            | Is Active            | true                            | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                           | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                           | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                 | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                                                             | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI}  |
      | Flex Table:General           | Display Field Names  | BaseSalary__c,Percentage__c,NumberOfPersonnel__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                                   |
      | Flex Table List              | Enable Row Grouping  | true                                                                             | AppContact                | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List              | Hide Grouping Column | false                                                                            | AppContact                | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List              | Help Text            | Help Base Salary                                                                 | AppContact                | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List              | Field Label Override | BaseSalary                                                                       | AppContact                | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List              | Enable Row Grouping  | true                                                                             | AppContact                | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List              | Hide Grouping Column | false                                                                            | AppContact                | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List              | Help Text            | Help Percentage                                                                  | AppContact                | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List              | Field Label Override | Percentage                                                                       | AppContact                | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List              | Enable Row Grouping  | true                                                                             | AppContact                | Name                      | {SavedValue:NumberOfPersonnel__c} |
      | Flex Table List              | Hide Grouping Column | false                                                                            | AppContact                | Name                      | {SavedValue:NumberOfPersonnel__c} |
      | Flex Table List              | Help Text            | Help Number Of Personnel                                                         | AppContact                | Name                      | {SavedValue:NumberOfPersonnel__c} |
      | Flex Table List              | Field Label Override | Number Of Personnel                                                              | AppContact                | Name                      | {SavedValue:NumberOfPersonnel__c} |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    #Currency Field
    Then I softly see "BaseSalary :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "BaseSalary" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help BaseSalary" shown as help text
    #Percent Field
    Then I softly see "Percentage :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Percentage" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Percentage" for flex table column
#    When I pause execution for "2" seconds
#    Then I softly see "Help Percentage" shown as help text
    #Number Field
    Then I softly see "Number Of Personnel :" inside rows of enhanced grid id "---applicationIntake:-:applicationContactsTableId---"
    Then I see column header "Number Of Personnel" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
#    And I hovering mouse on help text icon inside "Number Of Personnel" for flex table column
#    And I pause execution for "2" seconds
#    Then I softly see "Help Number Of Personnel" shown as help text

  @549700 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Export Setting, Record Selection
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue               | filterId         |
      | Flex Table            | Enable Export (PDF)              | true                            | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV)        | true                            | ApiGeneratedId:1 |
      | Flex Table:General    | Enable Record Selection          | true                            | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | left                            | ApiGeneratedId:3 |
      | Flex Table            | Display Field Names              | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Export (PDF)              | true                            | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV)        | true                            | AppContact         | Name                      |                            |
      | Flex Table:General    | Enable Record Selection          | true                            | AppContact         | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | left                            | AppContact         | Name                      |                            |
      | Flex Table:General    | Display Field Names              | {SavedValue:SPIContactTableDFN} | AppContact         | Name                      |                            |
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
    And I pause execution for "3" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    Then I softly see "Contacts" page block displayed
    Then I softly see record selection is displayed for tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I see "Menu" action is displayed at the "---applicationIntake:-:applicationContactsTableId---" modal
    And I click on "Menu" button inside table id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed

  @549702 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                           | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                           | ApiGeneratedId:3 |
      | Flex Grid             | Required Fields     |                                 | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN} | AppContact         | Name                      |                                 |
      | Flex Grid:General     | Default Page Size   | 5                               | AppContact         | Name                      |                                 |
      | Flex Table List       | Disable sort order  | false                           | AppContact         | Name                      | {SavedValue:Contact__c_SPI}     |
      | Flex Table List       | Disable sort order  | false                           | AppContact         | Name                      | {SavedValue:ProjectRole__c_SPI} |
      | Flex Grid:General     | Required Fields     | ProjectRole__c                  | AppContact         | Name                      |                                 |
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
    And I pause execution for "3" seconds
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    Then I softly see table contains "Showing 1 to 5" inside table id "---applicationIntake:-:applicationContactsTableId---"
    And I click on column name "Project Role" for sorting of table "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column name "Project Role" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column name "Project Role" with "Ascending" order
    And I pause execution for "5" seconds
    Then I softly see column name "Project Role" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see arrowIcon for column name "Project Role"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | --None--     |
    Then I softly see error message contains text "Please complete all field(s) marked in red." if mandatory fields are not filled

  @549703 @spidatatable
  Scenario:  3.0- Data Table Enhanced- SPI - Actions- View
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
    #  | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Action Name         | View                            | ApiGeneratedId:1 |
      | Flex Table Action     | Standard Action     | View                            | ApiGeneratedId:2 |
      | Flex Table Action     | Location            | Row                             | ApiGeneratedId:3 |
      | Flex Table Action     | Where To Open ?     | SameWindow                      | ApiGeneratedId:4 |
      | Flex Table Action     | Action Behavior     | OpenURL                         | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
   #   | Flex Table Action     | Is Active                | true          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Action Name         | View                            | AppContact         | Name                      | View                       |
      | Flex Table Action     | Standard Action     | View                            | AppContact         | Name                      | View                       |
      | Flex Table Action     | Location            | Row                             | AppContact         | Name                      | View                       |
      | Flex Table Action     | Where To Open ?     | SameWindow                      | AppContact         | Name                      | View                       |
      | Flex Table Action     | Action Behavior     | OpenURL                         | AppContact         | Name                      | View                       |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "5" seconds
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:PM Username}" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #Where to Open- Same Window
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly see "Contact Information" page block displayed
    And I pause execution for "5" seconds
    And I click on back arrow
    #Where to Open- New Tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | NewTab        | AppContact         | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | AppContact         | Name                      | View                       |
    And I refresh the page
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly see new tab is opened
    Then I softly see "Contact Information" page block displayed
    And I switch to tab number "1"
    And I switch to parent tab
    And I pause execution for "4" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal         | AppContact         | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | AppContact         | Name                      | View                       |
    And I refresh the page
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    #Where to Open- Modal
    Then I see "Create Contact" opens in overLay window
    #Then I softly see "Contact Information" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ? | SameWindow        | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior | OpenURL           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | NewWindow     | AppContact         | Name                      | View                       |
      | Flex Table Action     | Action Behavior | OpenURL       | AppContact         | Name                      | View                       |
    And I refresh the page
    #Where to Open- New Window
    And I click on "View" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly see new window is opened
    Then I softly see "Contact Information" page block displayed

  @549648
  Scenario: 3.0- Data Table Enhanced- PM- SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table            | Required Fields     |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts | Name                      |                             |
      | Flex Grid:General     | Default Page Size   | 5                            | DataTableEnhanceProgramContacts | Name                      |                             |
      | Flex Table List       | Disable sort order  | false                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Contact__c}     |
      | Flex Table List       | Disable sort order  | false                        | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ProjectRole__c} |
      | Flex Table            | Required Fields     | ProjectRole__c               | DataTableEnhanceProgramContacts | Name                      |                             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "7" seconds
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    Then I softly see table contains "Showing 1 to 5" inside table id "---program:-:contactsTableId---"
    And I click on column name "Project Role" for sorting of table "---program:-:contactsTableId---"
    Then I softly see column name "Project Role" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:contactsTableId---"
    Then I softly see column name "Project Role" with "Ascending" order
    And I pause execution for "5" seconds
    Then I softly see column name "Project Role" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see arrowIcon for column name "Project Role"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role |
      | {SavedValue:PM Username} | --None--     |
    Then I softly see error message contains text "Please complete all field(s) marked in red." if mandatory fields are not filled

  @549739 @InternalUser
  Scenario: 3.0- Data Table Enhanced- PM- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Page Block            | Is Active            | true                         | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:2  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:3  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:5  |
      | Flex Table List       | Show Link as Text    | false                        | ApiGeneratedId:6  |
      | Flex Table List       | Enable Row Grouping  | false                        | ApiGeneratedId:7  |
      | Flex Table List       | Hide Grouping Column | false                        | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                              | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:10 |
      | Flex Table List       | Show Link as Text    | false                        | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                                       | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names  | State__c,Name,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}  |
      | Flex Table List              | Hide Grouping Column | false                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}  |
      | Flex Table List              | Help Text            | Help State                                 | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}  |
      | Flex Table List              | Field Label Override | State                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}  |
      | Flex Table List              | Show Link as Text    | true                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}  |
      | Flex Table List              | Enable Row Grouping  | true                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Hide Grouping Column | false                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Help Text            | Help Standard                              | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Field Label Override | Name                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
      | Flex Table List              | Show Link as Text    | true                                       | DataTableEnhanceProgramContacts | Name                      | {SavedValue:KeyContactName_Name}      |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of all records in the table "---program:-:associateContactsTableId---"
    And I pause execution for "7" seconds
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    #Standard Field
    Then I softly see "Key Contacts Name :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "Key Contacts Name" displayed in tableId "---program:-:contactsTableId---"
    And I hovering mouse on help text icon inside "Key Contacts Name" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help Name" shown as help text
    Then I softly do not see hyperlink at column value "IN" inside "---program:-:contactsTableId---" table
    #Formula Text Field
    Then I softly see "State :" inside rows of enhanced grid id "---program:-:contactsTableId---"
    Then I see column header "State" displayed in tableId "---program:-:contactsTableId---"
    And I hovering mouse on help text icon inside "State" for flex table column
    And I pause execution for "2" seconds
    Then I softly see "Help State" shown as help text
    Then I softly do not see hyperlink at column value "{SavedValue:PM Username}" inside "---program:-:contactsTableId---" table

  @549781 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios-  Date and Date & Time data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                     | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Date__c,Date_And_Time__c | AppContact                |                           |                                  |
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
    When I click "Add" after selection of all records in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I pause execution for "7" seconds
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I perform quick search for "{SavedValue:SPI3 Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Date                   |
      | {SavedValue:SPI3 Username} | {Date:MM/dd/yyyy::d+7} |
    And I pause execution for "5" seconds
    #DateField-Search Exact Match
    And I perform quick search for "{Date:MM/dd/yyyy::d+7}" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{Date:MM/dd/yyyy::d+7}" for title "Date" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #DateField-Search Partial Match
    And I perform quick search for "3/" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #DateField-Search with Incorrect Data
    And I perform quick search for "3/30/2029" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #DateNTimeField-Search Partial Match
    And I perform quick search for "3/28/2026" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #DateNTimeField-Search with Incorrect Data
    And I perform quick search for "05:43 PM" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @#DateNTimeField-SearchExactMatch-SPI @spidatatable @DatenTime @wip @checkmanually
  Scenario: if failed check this manually #DateNTimeField-Search Exact Match - if failed check this manually
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                             | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Date_And_Time__c | AppContact                |                           |                                  |
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
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I click modal button "Close"
    And I pause execution for "5" seconds
    And I perform quick search for "{SavedValue:SPI3 Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Date And Time          |
      | {SavedValue:SPI3 Username} | {Date:MM/dd/yyyy::d+7} |
    And I pause execution for "5" seconds
    And I perform quick search for "{Date:MM/dd/yyyy::d+7}" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{Date:MM/dd/yyyy::d+7}" for title "Date And Time" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549782 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Standard, Formula, Reference & Text data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},CreatedBy,OtherProjectRole__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Other Project Role |
      | {SavedValue:PM Username}   | Properties         |
      | {SavedValue:EXE1 Username} | Test Data          |
      | {SavedValue:FD Username}   | Focus Area         |
      | {SavedValue:FO Username}   | Application Intake |
    And I pause execution for "4" seconds
    #StandardField-Search Exact Match
    And I perform quick search for "{SavedValue:SPI3 Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{SavedValue:SPI3 Username}" for title "Created By ID" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search Partial Match
    And I perform quick search for "mation SPI3" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{SavedValue:SPI3 Username}" for title "Created By ID" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Incorrect Data
    And I perform quick search for "automatied" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Extra Spaces
    And I perform quick search for "   matio n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #StandardField-Search with alphanumeric value
    And I perform quick search for "123auto" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #TextField - Search Exact
    And I pause execution for "5" seconds
    And I perform quick search for "Test Data" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Test Data" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search Partial Match
    And I perform quick search for "erties" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Properties" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with Incorrect Data
    And I perform quick search for "tested" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with Extra Spaces
    And I perform quick search for "   VA" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #TextField- Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #TextField-Search with alphanumeric value
    And I perform quick search for "123data" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549782_1 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Text Area, Long Text Area data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},Text_Area__c,Long_Text_Area__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Text area          | Long Text Area  |
      | {SavedValue:PM Username}   | Properties         | Subaward        |
      | {SavedValue:EXE1 Username} | Desk Review        | Progress Report |
      | {SavedValue:FD Username}   | Focus Area         | Program         |
      | {SavedValue:FO Username}   | Application Intake | Site Visit      |
    And I pause execution for "4" seconds
    #Text Area-Search Exact Match
    And I perform quick search for "Properties" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Properties" for title "Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Text Area Field-Search Partial Match
    And I perform quick search for "Area" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Focus Area" for title "Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Text Area Field-Search with Incorrect Data
    And I perform quick search for "automatied" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Text Area Field-Search with Extra Spaces
    And I perform quick search for "   prop n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Text Area Field-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Text Area Field-Search with alphanumeric value
    And I perform quick search for "123auto" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #Long Text Area Field - Search Exact
    And I pause execution for "5" seconds
    And I perform quick search for "Subaward" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Subaward" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Long Text Area Field-Search Partial Match
    And I perform quick search for "isit" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Site Visit" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Long Text Area Field-Search with Incorrect Data
    And I perform quick search for "tested" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Long Text Area Field-Search with Extra Spaces
    And I perform quick search for "   test n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Long Text Area Field-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Long Text Area Field-Search with alphanumeric value
    And I perform quick search for "123data" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549782_2 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Formula, Reference data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},State__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I pause execution for "4" seconds
    #Reference-Field-Search Exact Match
    And I perform quick search for "automationpm@gmail.com" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "automationpm@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Reference-Field-Search Partial Match
    And I perform quick search for "test@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "test@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Reference-Field-Search with Incorrect Data
    And I perform quick search for "automatied" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Reference-Field-Search with Extra Spaces
    And I perform quick search for "   mation " in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Reference-Field-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Reference-Field-Search with alphanumeric value
    And I perform quick search for "time90811" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "automationruntime90811@yopmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #Formula-Field - Search Exact
    And I pause execution for "5" seconds
    And I perform quick search for "VA" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "VA" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Formula-Field-Search Partial Match
    And I perform quick search for "K" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "AK" for title "State" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Formula-Field-Search with Incorrect Data
    And I perform quick search for "tested" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Formula-Field-Search with Extra Spaces
    And I perform quick search for "   VA" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Formula-Field- Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Formula-Field-Search with alphanumeric value
    And I perform quick search for "123VA" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549783
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Checkbox, Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                   | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},URL__c,ContactEmail__c | AppContact                |                           |                                  |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                      | Contact Email    | URL                           |
      | {SavedValue:PM Username}  | vrush@gmail.com  | www.google.com                |
      | {SavedValue:EXE Username} | exe@yopmail.com  | frwklwcaut.sandbox.lightning. |
      | {SavedValue:FD Username}  | fd@reisystems.in | https://app.keka.com/         |
      | {SavedValue:FO Username}  | fo@reisystems.in | https://jenkins.reisys.com/   |
    #Email-Search Exact Match
    And I perform quick search for "vr@gmail.com" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search Partial Match
    And I perform quick search for "vr" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Incorrect Data
    And I perform quick search for "vrn" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Extra Spaces
    And I perform quick search for "   vr 34" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #EmailFiled-Search with Special Characters
    And I perform quick search for "r@gma" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "vr@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #EmailField-Search with alphanumeric value
    And I perform quick search for "vid345" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "david345@gmail.com" for title "Email" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URL-Search Exact Match
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | URL               |
      | {SavedValue:PM Username} | www.microsoft.com |
    And I pause execution for "5" seconds
    When I perform quick search for "www.microsoft.com" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "www.microsoft.com" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URL-Search Partial Match
    And I perform quick search for "microsoft" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "www.microsoft.com" for title "URL" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URL-Search with Incorrect Data
    And I perform quick search for "wwww." in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with Extra Spaces
    And I perform quick search for "   micro n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #URLField-Search with alphanumeric value
    And I perform quick search for "123micro" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #ChekboxField Search Exact Match
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I pause execution for "5" seconds
    And I perform quick search for "True" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "True" for title "Is Key Contact" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Checkbox-Search Partial Match
    And I perform quick search for "fal" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "false" for title "Is Key Contact" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Checkbox-Search with Incorrect Data
    And I perform quick search for "truee" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #CheckboxField-Search with Extra Spaces
    And I perform quick search for "   false n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549784
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Picklist, Multiselect Picklist & Lookup field Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                  | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Test_Multipicklist__c | AppContact                |                           |                                  |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role         | Test Multipicklist |
      | {SavedValue:PM Username}   | Authorized Signatory | Test1              |
      | {SavedValue:EXE1 Username} | Ebiz POC             | Test1              |
      | {SavedValue:FD Username}   | Fiscal Contact       | Test1;Test3        |
      | {SavedValue:FO Username}   | Grants Administrator | Test1;Test3;Test4  |
    #Picklist-Search Exact Match
    And I perform quick search for "Authorized Signatory" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Authorized Signatory" for title "Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Picklist-Search Partial Match
    And I perform quick search for "Fisca" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Fiscal Contact" for title "Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Picklist-Filed-Search with Incorrect Data
    And I perform quick search for "vrn" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Picklist-Filed-Search with Extra Spaces
    And I perform quick search for "   vr 34" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Picklist-Filed-Search with Special Characters
    And I perform quick search for "r@gma" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Picklist-Field-Search with alphanumeric value
    And I perform quick search for "vid345" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup-field-Search Exact Match
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup-Search Partial Match
    And I perform quick search for "PM" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup-Search with Incorrect Data
    And I perform quick search for "Automated." in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup - Field-Search with Extra Spaces
    And I perform quick search for "Automatio  PM" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup - Field-Search with Special Characters
    And I perform quick search for "!#%@" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #Lookup - Field-Search with alphanumeric value
    And I perform quick search for "123micro" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #MultiSelect-Field Search Exact Match
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    And I perform quick search for "Test1" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Test1" for title "Test Multiselect" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #MultiSelect-Search Partial Match
    And I perform quick search for "Tes" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see value "Test1" for title "Test Multiselect" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #MultiSelect-Search with Incorrect Data
    And I perform quick search for "test12" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "5" seconds
    #MultiSelect-Field-Search with Extra Spaces
    And I perform quick search for "   test3 n" in "---applicationIntake:-:applicationContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:applicationContactsTableId---"

  @549785
  Scenario: 3.0- Data Table Enhanced- SPI -  Quick Search Scenarios- Numeric Data Type (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
      | Flex Table            | Enable Quick Search | true                            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                                             | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,NumberOfPersonnel__c,Percentage__c | AppContact                |                           |                                  |
      | Flex Table:General           | Enable Quick Search | true                                                                             | AppContact                |                           |                                  |
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
    And I select value inside table "---applicationIntake:-:applicationAssociateTableId---" is "All"
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Number Of Personnel | BaseSalary | Percentage |
      | {SavedValue:PM Username}  | 9                   | 34500.56   | 90         |
      | {SavedValue:EXE Username} | 23                  | 1500       | 12         |
      | {SavedValue:PO Username}  | 698                 | 100        | 67         |
      | {SavedValue:FD Username}  | 5                   | 1200       | 34         |
      | {SavedValue:FO Username}  | 4                   |            | 45         |
    #Percent - Search Exact Match
    And I perform quick search for "45" in "---program:-:contactsTableId---" panel
    Then I softly see value "45" for title "Percentage" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Percent - Search Partial Match
    And I perform quick search for "7" in "---program:-:contactsTableId---" panel
    Then I softly see value "67" for title "Percentage" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Percent - Search with Incorrect Data
    And I perform quick search for "089" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Percent - Search with Extra Spaces
    And I perform quick search for "   1 23" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Percent - Search with Special Characters
    And I perform quick search for "!#%" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Percent - Search with alphanumeric value
    And I perform quick search for "123ahkl" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    #Number - Search Exact Match
    And I perform quick search for "23" in "---program:-:contactsTableId---" panel
    Then I softly see value "23" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Number - Search Partial Match
    And I perform quick search for "69" in "---program:-:contactsTableId---" panel
    Then I softly see value "698" for title "Number Of Personnel" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Number - Search with Incorrect Data
    And I perform quick search for "089" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Number - Search with Extra Spaces
    And I perform quick search for "   1 23" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Number - Search with Special Characters
    And I perform quick search for "!#%" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Number - Search with alphanumeric value
    And I perform quick search for "123ahkl" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    #Currency - Search Exact Match
    And I perform quick search for "34500.56" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search Partial Match
    And I perform quick search for "500" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search Decimal Value
    And I perform quick search for ".5" in "---program:-:contactsTableId---" panel
    Then I softly see value "$34,500.56" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search with Incorrect Data
    And I perform quick search for "089" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search with Extra Spaces
    And I perform quick search for "   1 23" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search with Special Characters
    And I perform quick search for "!#%" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "5" seconds
    #Currency - Search with alphanumeric value
    And I perform quick search for "123ahkl" in "---program:-:contactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

  @549807
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Text Data Types (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},Text_Area__c,Long_Text_Area__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Text area          | Long Text Area  |
      | {SavedValue:PM Username}   | Properties         | Subaward        |
      | {SavedValue:EXE1 Username} | Desk Review        | Progress Report |
      | {SavedValue:FD Username}   | Focus Area         | Program         |
      | {SavedValue:FO Username}   | Application Intake | Site Visit      |
    And I pause execution for "4" seconds
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    #TextArea-contains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Text area | contains | Area |
    Then I softly see value "Focus Area" for title "Text area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #TextArea-doesnotcontains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Text area | does not contains | tk |
    Then I softly do not see value "tk" for title "Text area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #TextArea-startswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Text area | starts with | Desk |
    Then I softly see value "Desk Review" for title "Text area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #TextArea-endswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Text area | ends with | Intake |
    Then I softly see value "Application Intake" for title "Text area" inside table "---applicationIntake:-:applicationContactsTableId---"
    #LongTextArea-contains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Long Text Area | contains | Subaward |
    Then I softly see value "Subaward" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #LongTextArea-doesnotcontains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Long Text Area | does not contains | tk |
    Then I softly do not see value "tk" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #LongTextArea-startswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Long Text Area | starts with | Progress |
    Then I softly see value "Progress Report" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #LongTextArea-endswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Long Text Area | ends with | Report |
    Then I softly see value "Progress Report" for title "Long Text Area" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549807_1
  Scenario: 3.0- Data Table Enhanced- SPI - Advance Filter- Text Data Types (Text)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},OtherProjectRole__c | AppContact         |                           |                            |
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
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:EXE1 Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:EXE1 Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "Automation PO" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation PO" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FD Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:FO Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I select value inside table "---applicationIntake:-:applicationContactsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Other Project Role |
      | {SavedValue:PM Username}   | Properties         |
      | {SavedValue:EXE1 Username} | Desk Review        |
      | {SavedValue:FD Username}   | Focus Area         |
      | {SavedValue:FO Username}   | Application Intake |
    And I pause execution for "4" seconds
    And I click on advance filter of table id "---applicationIntake:-:applicationContactsTableId---" for LWC
    #Text-contains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Other Project Role | contains | Area |
    Then I softly see value "Focus Area" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Text-doesnotcontains
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Other Project Role | does not contains | tk |
    Then I softly do not see value "tk" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Text-startswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Other Project Role | starts with | Desk |
    Then I softly see value "Desk Review" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on button "Clear" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "3" seconds
    #Text-endswith
    And I enter advance filter values inside id "---applicationIntake:-:applicationContactsTableId---" for LWC
      | Other Project Role | ends with | Intake |
    Then I softly see value "Application Intake" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"

  @549701 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - List View Config
    Given I have "default" configuration as below:
      | configurationCategory     | fieldName      | fieldOrignalValue | filterId         |
      | Flex Grid:Flex Table List | Label          | Contacts          | ApiGeneratedId:0 |
      | Flex Grid:Flex Table List | Is Master View | false             | ApiGeneratedId:1 |
      | Flex Table List           | Default ?      | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory     | fieldName      | fieldNewValue       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Grid:Flex Table List | Label          | Automation Contacts | AppContact         | Name                      | FLV-4986                   |
      | Flex Grid:Flex Table List | Is Master View | true                | AppContact         | Name                      | FLV-4986                   |
      | Flex Table List           | Default ?      | true                | AppContact         | Name                      | FLV-4986                   |
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
    Then I see "Automation Contacts" shown as inside "---applicationIntake:-:applicationContactsTableId---"

  @549660 @spidatatable
  Scenario:3.0- Data Table Enhanced- SPI - Hide Expression Json- 2Groups(Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c   | AppContact         |                           |                                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:Groups2Combinationof2Scenarios | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549661 @spidatatable
  Scenario:3.0- Data Table Enhanced- SPI - Hide Expression Json- 3Groups(Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c   | AppContact         |                           |                                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:Groups2Combinationof2Scenarios | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549662 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c     | AppContact         |                           |                                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonCombinationSPI | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549664 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- User App
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGrantor                               | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGrantee                               | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:ROCJProjectRoleInUserAppRecipient                                             | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserAppStateAsGrantor                            | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInUserAppStateAsGrantee                            | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:ROCJProjectRoleNotInUserAppRecipient                                          | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549665 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonContextInCreateSPI                                          | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonContextInViewSPI                                            | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInContextEdit                                         | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonContextNotInCreateSPI                                       | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotInContextView                                      | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:ROCJProjectRoleNotInContextEdit                                               | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549667 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549668 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileInSPI                                                | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonProfileNotInSPI                                             | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549669 @spidatatable
  Scenario:  3.0- Data Table Enhanced- SPI - Hide Expression Json- $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryEquals$UserFirstName                                  | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryEquals$UserFirstName                                  | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryEquals$UserFirstName                                  | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotEquals$UserFirstName                               | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotEquals$UserFirstName                               | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryNotEquals$UserFirstName                               | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549670 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityEqualTonsk                                         | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityNotEqualTonsk                                      | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityNotEqualToContainsnsk                              | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityNotInsnsk                                          | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityNotInsnskNot                                       | AppContact         | Name                      | {SavedValue:State__c_FormulaText} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonFieldCityNotInsnskNot                                       | AppContact         | Name                      | {SavedValue:City__c_SPI}          |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see column header "Date And Time" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "State" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "City" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549663 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Hide Expression Json- Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c           | AppContact         |                           |                                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideColumnJsonBaseSalaryInQueuePM             | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HideExpressionJsonQueueNotInGovGrantTestQueue | AppContact         | Name                      | {SavedValue:URL__c_SPI}        |
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
    Then I softly do not see column header "BaseSalary" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:applicationContactsTableId---"

  @549691 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c           | AppContact         |                           |                                |
      | Flex Table List       | Hide Column JSON      |                                                                | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
      | Flex Table List       | Hide Column JSON      |                                                                | AppContact         | Name                      | {SavedValue:URL__c_SPI}        |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryInQueuePM             | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideExpressionJsonQueueNotInGovGrantTestQueue | AppContact         | Name                      | {SavedValue:URL__c_SPI}        |
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
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode

  @549692 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- User App
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,State__c,City__c | AppContact         |                           |                                   |
      | Flex Table List       | Read Only Column JSON | govgrants_config:ROCJProjectRoleInUserAppRecipientApp                                          | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGrantorApp                            | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryInUserAppStateAsGranteeApp                            | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Read Only Column JSON | govgrants_config:ROCJProjectRoleNotInUserAppRecipientApp                                       | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
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
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode
    Then I softly see fields "Date__c" is in edit mode
    Then I softly see fields "Date_And_Time__c" is in edit mode

  @549693 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,Percentage__c,Email__c | AppContact         |                           |                                   |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryInContextEditApp                                            | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideExpressionJsonContextInCreateSPIApp                                             | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideExpressionJsonContextInViewSPIApp                                               | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryNotInContextEditApp                                         | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideExpressionJsonContextNotInCreateSPIApp                                          | AppContact         | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryNotInContextViewApp                                         | AppContact         | Name                      | {SavedValue:Email_SPI}            |
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
    And I pause execution for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode
    Then I softly see fields "Date__c" is in edit mode
    Then I softly see fields "Date_And_Time__c" is in edit mode
    Then I softly do not see fields "Percentage__c" is in edit mode
    Then I softly do not see fields "Email_c" is in edit mode

  @549694 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,Percentage__c,Email__c | AppContact         |                           |                                   |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideForProfileSPIPostCreateApplication                                              | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionForProfileNotInSPI                                                        | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionForProfileInEXE                                                           | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionForProfileNotInEXE                                                        | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideExpressionJsonContextNotInCreateSPIApp                                          | AppContact         | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryNotInContextViewApp                                         | AppContact         | Name                      | {SavedValue:Email_SPI}            |
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
    And I pause execution for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode
    Then I softly see fields "Date__c" is in edit mode
    Then I softly do not see fields "Date_And_Time__c" is in edit mode
    Then I softly do not see fields "Percentage__c" is in edit mode
    Then I softly do not see fields "Email_c" is in edit mode

  @549696 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c               | AppContact         |                           |                                |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideFirstNameAutomationPostCreateApplication      | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionFor$UserNotEqualsFirstNameAutomationSPI | AppContact         | Name                      | {SavedValue:URL__c_SPI}        |
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
    And I pause execution for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode

  @549697 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,Percentage__c,ContactEmail__c | AppContact         |                           |                                   |
      | Flex Table List       | Read Only Column JSON | govgrants_config:UserTypeApplicantPostCreateApplication                                                     | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryUserTypeInReviewer                                                 | AppContact         | Name                      | {SavedValue:URL__c_SPI}           |
      | Flex Table List       | Read Only Column JSON | govgrants_config:UserTypeInternalPostCreateApplication                                                      | AppContact         | Name                      | {SavedValue:Date__c_SPI}          |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionForUserTypeNotInApplicantSPI                                                     | AppContact         | Name                      | {SavedValue:Date_And_Time__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HEBJActionForUserTypeNotInApplicantSPI                                                     | AppContact         | Name                      | {SavedValue:Percentage__c_SPI}    |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideColumnJsonBaseSalaryNotInContextViewApp                                                | AppContact         | Name                      | {SavedValue:Email_SPI}            |
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
    And I pause execution for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly see fields "URL__c" is in edit mode
    Then I softly see fields "Date__c" is in edit mode
    Then I softly see fields "Date_And_Time__c" is in edit mode

  @549695 @spidatatable
  Scenario: 3.0- Data Table Enhanced- SPI - Read Only Column Json- Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIContactTableDFN},BaseSalary__c,URL__c,Date__c,Date_And_Time__c,Percentage__c,Email__c | AppContact         |                           |                                |
      | Flex Table List       | Read Only Column JSON | govgrants_config:HideForStatusAsCreateCreateApplication                                              | AppContact         | Name                      | {SavedValue:BaseSalary__c_SPI} |
      | Flex Table List       | Read Only Column JSON | govgrants_config:FieldContainsCreated                                                                | AppContact         | Name                      | {SavedValue:URL__c_SPI}        |
      | Flex Table List       | Read Only Column JSON | govgrants_config:FieldNotInCreated                                                                   | AppContact         | Name                      | {SavedValue:Date__c_SPI}       |
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
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I pause execution for "2" seconds
    Then I softly do not see fields "BaseSalary__c" is in edit mode
    Then I softly do not see fields "URL__c" is in edit mode
    Then I softly see fields "Date__c" is in edit mode

  @test
  Scenario: test
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Dl000002ReMpIAK/view"
    And I pause execution for "4" seconds
   # And I get "color"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | BaseSalary |
      | {SavedValue:EXE Username} | 1000       |
    Then I softly see background color "Orange" for "$1,000.00" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"


