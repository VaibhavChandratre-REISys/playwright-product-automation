@PageLayout @StaticTextField @ViewLayout @PageLayout1
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @352705 @352913 @353253 @353254
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify that static text should get render on page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
     # | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-42115                  |
   #   | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see static text "Testing Purpose" inside page block

    Examples:
      | User  |
    #  | Admin |
      | PM    |

  @353256 @353257
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify when Is Active is checked as false then field will not display on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
     # | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor State Program | Name                      | PBD-42115                  |
   #   | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:
      | User  |
     # | Admin |
      | PM    |

  @353262 @thisisforadminuseronly
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for profile if system administrator profile is selected then the static field will hidden for the respective profile.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | System Administrator | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:
      | User  |
      | ADMIN |


  @353265 @353266
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for user if applicant is selected then the static field will hidden for the respective user.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for User | Applicant     | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see static text "Testing Purpose" inside page block

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @353268 @353269
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for user if internal is selected then the static field will hidden for the respective user.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for User | Internal      | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @353274 @353275
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for context if view is selected then the static field will hidden for the respective context.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for Context | View          | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:

      | User  |
     # | ADMIN |
      | PM    |

  @353278 @353279
  Scenario Outline: LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for context if view is selected then the static field will hidden for the respective context.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for Context | View          | Grantor State Program | Name                      | PBD-42115                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @353281 @353282
  Scenario Outline:LWC-Flex View Layout -Static Text Fields - Config- Admin-To verify in hide for context if create is selected then the static field will hidden for the respective context.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for Context | Create        | Grantor State Program Create | Name                      | PBD-42150                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I pause execution for "5" seconds
    Then I softly do not see static text "Testing Purpose" inside page block

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @353277
  Scenario: LWC-Flex View Layout -Static Text Fields - Config- SPI-To verify in hide for context if view is selected then the static field will hidden for the respective context.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Recipient ApplicationView | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for Context | View          | Recipient ApplicationView | Name                      | PBD-42148                  |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "10" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly do not see static text "Testing Static Text" inside page block

  @352314 @353255
  Scenario: LWC-Flex View Layout -Static Text Fields - Config- SPI-To verify that static text should get render on page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
     # | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | PBD-42148                  |
   #   | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose | Grantor State Program | Name                      | PBD-42148                  |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly see static text "Testing Static Text" inside page block

  @353258
  Scenario: LWC-Flex View Layout -Static Text Fields - Config- SPI-To verify when Is Active is checked as false then field will not display on view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
     # | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Recipient ApplicationView | Name                      | PBD-42148                  |
   #   | Page Block Config:Page Block Rule Detail | Static Text | Testing Purpose | Grantor State Program | Name                      | PBD-42148                  |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see static text "Testing Static Text" inside page block

  @353267
  Scenario: LWC-Flex View Layout -Static Text Fields - Config- SPI-To verify in hide for user if applicant is selected then the static field will hidden for the respective user.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Recipient ApplicationView | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for User | Applicant     | Recipient ApplicationView | Name                      | PBD-42148                  |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see static text "Testing Static Text" inside page block

  @353283
  Scenario: LWC-Flex View Layout -Static Text Fields - Config- SPI-To verify in hide for context if create is selected then the static field will hidden for the respective context.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide for Context |                   | Grantor Application Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide for Context | Create        | Grantor Application Create | Name                      | PBD-42149                  |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    Then I softly do not see static text "Static Text For Create" inside page block

