@FW-1544 @US-FW-1544
Feature:  Scenarios
Business Need: Layout, Form, Modal, Table, Grid - Support for adding default colors to fields based on value.

  @FW-1565 @Currency,Picklist,Number
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                              | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},NumberOfPersonnel__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "ADMIN" user
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role         | BaseSalary | Number Of Personnel |
      | {SavedValue:EXE Username} | Authorized Signatory | 1000       | 7                   |
    Then I softly see background color "Orange" for "$1,000.00" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "Authorized Signatory" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "7" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1565_1 @Checkbox,Email,URL
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},URL__c,IsKeyContact__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "ADMIN" user
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | URL            | Is Key Contact | Contact Email          |
      | {SavedValue:EXE Username} | www.google.com | Checked        | vrushanewase@gmail.com |
    And I pause execution for "4" seconds
    Then I softly see background color "Green" for "www.google.com" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "True" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "vrushanewase@gmail.com" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1565_2 @TextArea,Phonenumber,Percentage,Text
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                                             | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Name,Phone_Number__c,Percentage__c,OtherProjectRole__c,Text_Area__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "ADMIN" user
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Percentage | Other Project Role | Text Area |
      | {SavedValue:EXE Username} | 9527371482   | 80         | TEST               | Text Area |
    And I pause execution for "4" seconds
    Then I softly see background color "Orange" for "9527371482" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "80%" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "TEST" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "Text Area" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1566 @Currency,Picklist,Number
  Scenario: TC - LWC - Support to default colors based on fields value - PM - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                              | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},NumberOfPersonnel__c | DataTableEnhanceProgramContacts |                           |                                       |
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | BaseSalary | Number Of Personnel |
      | {SavedValue:EXE Username} | 1000       | 7                   |
    Then I softly see background color "Orange" for "$1,000.00" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "Authorized Signatory" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "7" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1566_1 @Checkbox,Email,URL,Formula(Email__c)
  Scenario: TC - LWC - Support to default colors based on fields value - PM - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},URL__c,IsKeyContact__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                       |
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | URL            | Is Key Contact | Contact Email          |
      | {SavedValue:EXE Username} | www.google.com | Checked        | vrushanewase@gmail.com |
    And I pause execution for "4" seconds
    Then I softly see background color "Green" for "www.google.com" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "True" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "vrushanewase@gmail.com" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1566_2 @TextArea,Phonenumber,Percentage,Text
  Scenario: TC - LWC - Support to default colors based on fields value - PM - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                                             | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Name,Phone_Number__c,Percentage__c,OtherProjectRole__c,Text_Area__c | DataTableEnhanceProgramContacts |                           |                                       |
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Percentage | Other Project Role | Text Area |
      | {SavedValue:EXE Username} | 9527371482   | 80         | TEST               | Text Area |
    And I pause execution for "4" seconds
    Then I softly see background color "Orange" for "a2fDa000000NzAz" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "9527371482" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "80%" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "TEST" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "Text Area" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1572 @FW-1573
  Scenario Outline: TC - LWC - Support to default colors based on fields value - Admin - To verify that field color should be change when the value inside the field changes dynamically
  |TC - LWC - Support to default colors based on fields value - PM - To verify that field color should be change when the value inside the field changes dynamically|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                           | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Phone_Number__c,Percentage__c,OtherProjectRole__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "<User>" user
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
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Percentage | Other Project Role |
      | {SavedValue:EXE Username} | 9527371482   | 80         | TEST               |
    And I pause execution for "4" seconds
    Then I softly see background color "Orange" for "a2fDa000000NzAz" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "9527371482" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Orange" for "80%" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly see background color "Green" for "TEST" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Percentage | Other Project Role |
      | {SavedValue:EXE Username} | 9527371483   | 79         | TEST Data          |
    And I pause execution for "4" seconds
    Then I softly do not see background color "Orange" for "9527371483" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly do not see background color "Orange" for "79%" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"
    Then I softly do not see background color "Green" for "TEST Data" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

    Examples:
      | User  |
      | ADMIN |
      | PM    |

  @FW-1575 @Currency,Picklist,Number,Text @Layout
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that the user should be able to see system's default styling when the field value does not match any configured color
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:NumberOfApprovals}          |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I enter value "ABC" into field "Abbreviation__c"
    And I enter value "Project Grants" into field "Type__c"
    And I enter value "3" into field "NumberOfApprovalSteps__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see color "Dark Green" for "$3,000" for field "X_Funded Amount"
    Then I softly see color "Dark Green" for "ABC" for field "Abbreviation"
    Then I softly see color "Deep Orange" for "Project Grants" for field "Types"
    Then I softly see color "Black" for "3" for field "X_Number of Approval Steps"

  @FW-1575_1 @PhoneNumber,Email,Checkbox,Percent @Layout
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that the user should be able to see system's default styling when the field value does not match any configured color
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:Percent__c}         |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I enter value "(952) 737-1482" into field "Phone_Number__c"
    And I enter value "vrushanewase@gmail.com" into field "Email_Test__c"
    And I enter value "Checked" into field "CFDA_Data__c"
    And I enter value "70" into field "Percent__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see color "Blue" for "(952) 737-1482" for field "Phone Number"
    Then I softly see color "Blue" for "vrushanewase@gmail.com" for field "Email Test"
    #Then I softly see color "GRAY" for "True" for field "X_CFDA Data"
    Then I softly see color "DARK GRAY" for "70%" for field "Percent"

  @FW-1567 @Currency,Number,Picklist,Percentage
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                                             | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},BaseSalary__c,NumberOfPersonnel__c,Percentage__c | AppContact                |                           |                                  |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | BaseSalary | Number Of Personnel | Percentage |
      | {SavedValue:SPI3 Username} | 1000       | 7                   | 80         |
    And I pause execution for "2" seconds
    Then I softly see background color "Green" for "Project Director/Manager" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Orange" for "$1,000.00" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Green" for "7" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Green" for "80%" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"

  @FW-1567_1 @PhoneNumber,Email,URL,Text
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                                                       | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Phone_Number__c,ContactEmail__c,URL__c,OtherProjectRole__c | AppContact                |                           |                                  |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Phone Number | Contact Email          | URL            | Other Project Role |
      | {SavedValue:SPI3 Username} | 9527371482   | vrushanewase@gmail.com | www.google.com | TEST               |
    And I pause execution for "2" seconds
    Then I softly see background color "Orange" for "9527371482" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Orange" for "vrushanewase@gmail.com" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Green" for "www.google.com" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Green" for "TEST" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"

  @FW-1567_2 @Formula-Email,TextArea
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that user should be able to see distinct field colors for different field values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                  | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Text_Area__c,Email__c | AppContact                |                           |                                  |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Text Area |
      | {SavedValue:SPI3 Username} | Text Area |
    And I pause execution for "2" seconds
    Then I softly see background color "Green" for "automationspi31@yopmail.com" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Orange" for "Text Area" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"

  @FW-1574
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that field color should be change when the value inside the field changes dynamically- Data Table Enhanced
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                  | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},Text_Area__c,Email__c | AppContact                |                           |                                  |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    Then I softly do not see background color "Orange" for "Text Area" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Text Area |
      | {SavedValue:SPI3 Username} | Text Area |
    And I pause execution for "2" seconds
    Then I softly see background color "Green" for "automationspi31@yopmail.com" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see background color "Orange" for "Text Area" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"

  @FW-1577 @Text,PhoneNumber,Number,URl,Picklist @SPILayout
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that the user should be able to see system's default styling when the field value does not match any configured color
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                        |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {SavedValue:SPI_Text_CFDANumber__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {SavedValue:SPI_AuthorizedRepresentativePhone__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {SavedValue:SPI_URL__c}                           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {SavedValue:SPI_Number_ApplicationRank__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {SavedValue:SPI_Picklist_ProgramIncome__c}        |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Collapse" in page detail
    When I navigate to "Overview" sub tab
    And I enter value "ABC" into field "CFDANumber__c"
    And I enter value "9527371482" into field "AuthorizedRepresentativePhone__c"
    And I enter value "www.google.com" into field "URL__c"
    And I enter value "7" into field "ApplicationRank__c"
    And I enter value "Additive" into field "ProgramIncome__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see color "Green" for "ABC" for field "Assistance Listing #"
    Then I softly see color "Red" for "(952) 737-1482" for field "Authorized Representative Phone"
    Then I softly see color "Green" for "www.google.com" for field "URL"
    Then I softly see color "Green" for "7" for field "X_Application Rank"
    Then I softly see color "Green" for "Additive" for field "Program Income"
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter value "PQR" into field "CFDANumber__c"
    And I enter value "9527371483" into field "AuthorizedRepresentativePhone__c"
    And I enter value "www.facebook.com" into field "URL__c"
    And I enter value "8" into field "ApplicationRank__c"
    And I enter value "Matching" into field "ProgramIncome__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly do not see color "Green" for "PQR" for field "Assistance Listing #"
    Then I softly do not see color "Red" for "(952) 737-1483" for field "Authorized Representative Phone"
    Then I softly do not see color "Green" for "www.facebook.com" for field "URL"
    Then I softly do not see color "Green" for "8" for field "X_Application Rank"
    Then I softly do not see color "Green" for "Matching" for field "Program Income"

  @FW-1580 @SPIForm @Currency,TextArea,Text,Picklist,Email
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that user should be able to see distinct field colors for different field values if only matches the condition as added in json added in the style config-Forms
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                   |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I enter value "1000" into field "Base_Salary__c"
    And I enter value "Text Area" into field "AgencyRoutingIdentifier__c"
    And I enter value "Test" into field "ApplicantIdentifier__c"
    And I enter value "US Citizen" into field "Citizenship__c"
    And I enter value "vrushanewase@gmail.com" into field "Email__c"
    And I click on "Save" in the page details
    Then I softly see color "Green" for "ABC" for field "Assistance Listing #"
    Then I softly see color "Red" for "(952) 737-1482" for field "Authorized Representative Phone"
    Then I softly see color "Green" for "www.google.com" for field "URL"
    Then I softly see color "Green" for "7" for field "X_Application Rank"
    Then I softly see color "Green" for "Additive" for field "Program Income"

  @FW-1580_1 @Percent,Phone,URL @SPIForm
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that user should be able to see distinct field colors for different field values if only matches the condition as added in json added in the style config-Forms
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Website__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I enter value "80" into field "FederalShare__c"
    And I enter value "www.google.com" into field "Website__c"
    And I enter value "9527371482" into field "Phone__c"
    And I click on "Save" in the page details
    Then I softly see color "Green" for "80%" for field "Federal Share"
    Then I softly see color "Red" for "(952) 737-1482" for field "Phone"
    Then I softly see color "Green" for "www.google.com" for field "Website"

  @FW-1606
  Scenario: TC - LWC - Support to default colors based on fields value - SPI - To verify that if no json added in style and only class name passed then color displaying entire column values without evaluating any condition
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Page Block            | Is Active           | true                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                    | Recipient ApplicationView | Name                      | {SavedValue:ContactPageBlockSPI} |
      | Flex Table:General           | Display Field Names | {SavedValue:SPIContactTableDFN},City__c | AppContact                |                           |                                  |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Collapse" in page detail
    Then I softly see background color "Orange" for "nsk" against value "{SavedValue:SPI3 Username}" in tableId "---applicationIntake:-:applicationContactsTableId---"

  @FW-1604
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that if no json added in style and only class name passed then color displaying entire column values without evaluating any condition
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                    | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Program__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    Then I softly see background color "Orange" for "{SavedValue:PEGMSID}" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1605
  Scenario: TC - LWC - Support to default colors based on fields value - PM - To verify that if no json added in style and only class name passed then color displaying entire column values without evaluating any condition
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Page Block            | Is Active           | true                         | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                    | Grantor State Program           | Name                      | {SavedValue:ContactPageBlockInternal} |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN},Program__c | DataTableEnhanceProgramContacts |                           |                                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    Then I softly see background color "Orange" for "{SavedValue:PEGMSID}" against value "{SavedValue:EXE Username}" in tableId "---program:-:contactsTableId---"

  @FW-1578
  Scenario: TC - LWC - Support to default colors based on fields value - Admin - To verify that user should be able to see distinct field colors for different field values if only matches the condition as added in json added in the style config - Forms
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Website__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Collapse" in page detail
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I navigate to "Test Tab" sub tab
    And I enter value "80" into field "FederalShare__c"
    And I enter value "www.google.com" into field "Website__c"
    And I enter value "9527371482" into field "Phone__c"
    And I click on "Save" in the page details
    Then I softly see color "Green" for "80%" for field "Federal Share"
    Then I softly see color "Red" for "(952) 737-1482" for field "Phone"
    Then I softly see color "Green" for "www.google.com" for field "Website"
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Test Tab" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Then I softly see color "Green" for "80%" for field "Federal Share"
    Then I softly see color "Red" for "(952) 737-1482" for field "Phone"
    Then I softly see color "Green" for "www.google.com" for field "Website"

  @FW-1579
  Scenario: TC - LWC - Support to default colors based on fields value - PM - To verify that user should be able to see distinct field colors for different field values if only matches the condition as added in json added in the style config - Forms
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Website__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Collapse" in page detail
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I navigate to "Test Tab" sub tab
    And I enter value "80" into field "FederalShare__c"
    And I enter value "www.google.com" into field "Website__c"
    And I enter value "9527371482" into field "Phone__c"
    And I click on "Save" in the page details
    Then I softly see color "Green" for "80%" for field "Federal Share"
    Then I softly see color "Red" for "(952) 737-1482" for field "Phone"
    Then I softly see color "Green" for "www.google.com" for field "Website"
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Test Tab" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Then I softly see color "Green" for "80%" for field "Federal Share"
    Then I softly see color "Red" for "(952) 737-1482" for field "Phone"
    Then I softly see color "Green" for "www.google.com" for field "Website"
