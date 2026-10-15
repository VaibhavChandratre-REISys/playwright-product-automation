@FieldDataTypes @ViewLayout @PageLayout1 @PageLayout
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @314597 @314598 @314635 @314636
  Scenario Outline: LWC-Flex View Layout - Fields - UI - Admin- To verify that Standard fields should be rendered on view layout
  LWC-Flex View Layout - Fields - UI - Admin- To verify that 'Text' datatype field should be rendered on view layout
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "CreatedById" inside page block
    Then I softly see field "LastModifiedById" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314638 @314639
  Scenario Outline:LWC-Flex View Layout - Fields - UI - Admin - To verify that 'Text Area' datatype field should be rendered on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:TextAreaField_Authorization} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Authorization__c" inside page block
    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314642 @314643 @314648 @314650
  Scenario Outline: LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Long Text Area' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Number' datatype field should be rendered on view layout
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
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Objectives__c" inside page block
    Then I softly see field "NumberOfApprovalSteps__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314655 @314665 @314671 @314672
  Scenario Outline: LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Picklist' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Lookup' datatype field should be rendered on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35271                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35167                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "KPIsRequired__c" inside page block
    Then I softly see field "Account__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314676 @314678 @314719 @314720
  Scenario Outline: LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Formula' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Checkbox' datatype field should be rendered on Page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:FormulaField_PrimaryFunderType} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:CheckField_CFDA}                |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "PrimaryFunderType__c" inside page block
    Then I softly see field "CFDA_Data__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314722 @314723 @314749 @314750 @435117
  Scenario Outline: LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'URL' datatype field should be rendered on Page block
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Date' datatype field should be rendered on Page block
  LWC - Flex View Layout - Fields Master Test Case - UI - To verify that Date field should be rendered on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateField_EndDate}       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Website Address" inside page block
    Then I softly see field "EndDate__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @356150 @356151 @356189 @356190
  Scenario Outline: LWC-Flex View Layout - Fields - UI - Admin - To verify that 'Date/Time' datatype field should be rendered on view layout
  LWC-Flex View Layout - Fields - UI - Admin - To verify that 'Email' datatype field should be rendered on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateAndTimeField_DateAndTime} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest}         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Date_And_Time__c" inside page block
    Then I softly see field "Email_Test__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @356201 @356206 @314795
  Scenario Outline: LWC-Flex View Layout - Fields - UI - Admin - To verify that 'Phone' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that Reference field should be rendered on Page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:PhoneField_PhoneNumber} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:PicklistTypeField}      |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Phone_Number__c" inside page block
    Then I softly see field "Type" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @314602 @314637 @314674
  Scenario: LWC-Flex View Layout - Fields - UI - SPI - To verify that Standard fields should be rendered on view layout
  LWC-Flex View Layout - Fields - UI - SPI - To verify that 'Text' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Lookup' datatype field should be rendered on view layout
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
    And I navigate to "Overview" sub tab
    And I enter value "VA" into field "Addressline1__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Name" inside page block
    Then I softly see field "CreatedById" inside page block
    Then I softly see field "LastModifiedById" inside page block

  @314640 @314644 @314653 @314666 @314797
  Scenario: LWC-Flex View Layout - Fields - UI - SPI - To verify that 'Text Area' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Long Text Area' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Number' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Picklist' datatype field should be rendered on view layout
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Formula' datatype field should be rendered on Page block
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that Reference field should be rendered on Page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:4 |
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
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Contingencies Justification" inside page block
    Then I softly see field "AgencyContact__c" inside page block
    Then I softly see field "NumberOfApprovalSteps__c" inside page block
    Then I softly see field "State__c" inside page block
    Then I softly see field "Announcement__r.AnnouncementName__c" inside page block

  @314721 @314736
  Scenario: LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Checkbox' datatype field should be rendered on Page block
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'URL' datatype field should be rendered on Page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:IsHistory__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:URL__c}       |
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
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "IsHistory__c" inside page block
    Then I softly see field "URL__c" inside page block

  @314755 @314760 @356058
  Scenario: LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Currency' datatype field should be rendered on Page block
  LWC-Flex View Layout - Page Block Details - UI - SPI - To verify that 'Rich Text Area' datatype field should be rendered on Page block
  LWC - Flex View Layout - Fields - SPI - UI - To verify that all datatypes fields should be visible on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-37910                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-37897                  |
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
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    Then I softly see field "AwardCeiling__c" inside page block
    Then I softly see field "Justification__c" inside page block

  @356156 @356192
  Scenario: LWC-Flex View Layout - Fields - UI - SPI - To verify that 'Date/Time' datatype field should be rendered on view layout
  LWC-Flex View Layout - Fields - UI - SPI - To verify that 'Email' datatype field should be rendered on view layout
  LWC-Flex View Layout - Fields - UI - SPI - To verify that 'Phone' datatype field should be rendered on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-37933                                           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-42102                                           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {configChecklist2:AuthorizedRepresentativePhone__c} |
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
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
   # When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    Then I softly see field "SubmittedOn__c" inside page block
    Then I softly see field "EmailAddress__c" inside page block
    Then I softly see field "AuthorizedRepresentativePhone__c" inside page block
