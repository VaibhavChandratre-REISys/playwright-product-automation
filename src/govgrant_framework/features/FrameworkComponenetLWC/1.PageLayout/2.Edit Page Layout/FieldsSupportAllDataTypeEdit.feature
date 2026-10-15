@PageLayout @FieldDataTypes @EditLayout @PageLayout2
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @356349 @356351 @356363 @356365
  Scenario Outline: LWC - Flex Edit Layout - Fields - UI - Admin- To verify that Standard fields should be rendered on edit layout
  LWC - Flex Edit Layout - Fields - UI - Admin- To verify that 'Text' datatype field should be rendered on edit layout
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "CreatedById" inside page block
    Then I softly see field "LastModifiedById" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @356392 @356663
  Scenario Outline: LWC - Flex Edit Layout - Fields - UI - Admin - To verify that 'Text Area' datatype field should be rendered on edit layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:TextAreaField_Authorization} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Authorization__c" inside page block
    Examples:
      | User |
   #   | Admin |
      | PM   |

  @358395 @358396 @358398 @358400
  Scenario Outline: LWC - Flex Edit Layout - Page Block Details - UI - Admin - To verify that 'Long Text Area' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - Admin - To verify that 'Number' datatype field should be rendered on edit layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:ObjectiveField}                    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:NumberField_NumberOfApprovalSteps} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Objectives__c" inside page block
    Then I softly see field "NumberOfApprovalSteps__c" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @358404 @358405 @358408 @358411
  Scenario Outline: LWC - Flex Edit Layout - Page Block Details - UI - Admin - To verify that 'Picklist' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - Admin - To verify that 'Lookup' datatype field should be rendered on edit layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35271                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35167                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "KPIsRequired__c" inside page block
    Then I softly see field "Account__c" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @358504 @358975
  Scenario Outline: LWC - Flex Edit Layout - Page Block Details - UI - Admin - To verify that 'Formula' datatype field should be rendered on edit layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:FormulaField_PrimaryFunderType} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:CheckField_CFDA}                |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "PrimaryFunderType__c" inside page block
    Then I softly see field "CFDA_Data__c" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @356354 @356390 @358413
  Scenario: LWC - Flex Edit Layout - Fields - UI - SPI - To verify that Standard fields should be rendered on edit layout
  LWC - Flex Edit Layout - Fields - UI - SPI - To verify that 'Text' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - SPI - To verify that 'Lookup' datatype field should be rendered on edit layout
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "10" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "VA" into field "Addressline1__c"
    When I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "CreatedById" inside page block
    Then I softly see field "LastModifiedById" inside page block

  @356665 @358397 @358402 @358407
  Scenario:LWC - Flex Edit Layout - Fields - UI - SPI - To verify that 'Text Area' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - SPI - To verify that 'Long Text Area' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - SPI - To verify that 'Number' datatype field should be rendered on edit layout
  LWC - Flex Edit Layout - Page Block Details - UI - SPI - To verify that 'Picklist' datatype field should be rendered on edit layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:ContingenciesJustification__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:AgencyContact__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:NumberOfApprovalSteps__c1}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-37893                                        |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-37691                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "VA" into field "Addressline1__c"
    When I navigate to "Overview" sub tab
    Then I softly see field "ContingenciesJustification__c" inside page block
    Then I softly see field "AgencyContact__c" inside page block
    Then I softly see field "NumberOfApprovalSteps__c" inside page block
    Then I softly see field "State__c" inside page block
    Then I softly see field "Announcement__r.AnnouncementName__c" inside page block

