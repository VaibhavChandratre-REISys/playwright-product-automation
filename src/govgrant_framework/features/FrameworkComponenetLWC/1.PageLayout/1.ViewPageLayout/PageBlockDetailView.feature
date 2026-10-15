@PageLayout @PageBlockDetailView @ViewLayout @PageLayout1 @Layouts
Feature: Page Layout Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @337535 @thisisforadminuseronly
  Scenario Outline: LWC - Flex View Layout - Hide Logic Fields - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that field should be hide for System Administrator profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | System Administrator | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress} |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User  |
      | ADMIN |

  @337747 @337764
  Scenario Outline: LWC - Flex View Layout - Hide Logic Fields- Admin - Config - To verify that when user select 'PM' in 'Hide For Profile' then that fields should be hide for PM profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress} |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @337785
  Scenario Outline: LWC - Flex View Layout - Hide Logic Fields - Admin - Config - To verify that when user select 'View' in 'Hide for Context' then that field should be hide for view layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide For Context | View          | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress} |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337801 @337805
  Scenario Outline: LWC - Flex View Layout - Hide Logic fields - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that fields should be hide for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Grantor State Program | Name                      | {pagelayout:URLField_WebsiteAddress} |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338699 @338764
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Internal' as Right Operand then field should be hidden for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserTypeIn | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @338839 @338842
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then  field  should be hidden for view layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                 | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextView | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @338872
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then field should be hidden for State As Grantor app.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserAppGrantor | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @338915 @338919
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then that field should be hidden for all layouts except view layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextNotInInternalView | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @338928 @338935
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then field should be hidden except State As Grantor app
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserAppNotInInternal | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

############## Multiple Hide Logic Test Cases #####################
  @339061 @309062 @382306 @lwcsanity @382307 @382308
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  operator
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDANDOperatorUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
      #| Admin |
      | PM    |

  @339064 @339065 @339066 @339067
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator
  LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure multiple hide expressions on same time
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDOROperatorUsedonEmail | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    #And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339068 @339069
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Contains’ that field should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserContainsFieldUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #  | Admin |
      | PM    |

  @339070
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify hide expression for field can be used using Left operand as ‘Field’
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsEqualsFieldsUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339187 @339196
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘In’ that field should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsInFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339199 @339293
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Not In’ that field should display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsNOTInFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter value "Formula Grants" into field "Type__c"
    #And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I see field "Email Test" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339294 @339297
  Scenario Outline:   LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Equals’ that field should not display on edit layout for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339301 @339305
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Not Equals’ that field should display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsNOTEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "ABC" into field "Abbreviation__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I see field "Email Test" inside page block
    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @339306 @339308
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals', that field should not display on UI for values greater than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                      | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsLESSTHANEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I cannot see field "Funded Amount" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339362 @339363
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin -Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                         | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsGreaterTHANEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "2000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Funded Amount" inside page block
    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @339367 @339369
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’, field should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsLessThanFreeTextUsed | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Funded Amount" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339370 @339371
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                   | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsGreaterThanFreeTextUsed | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Funded Amount" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339375 @339375
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘Field’ and operator as ‘Contains’ that field should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsContainsFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339381 @339399
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘In’ that field should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                  | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameINFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @339411 @339412
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Not In’ that field should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                     | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameNOTINFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339415 @339417
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Equals’ that field should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                      | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserFirstNameEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
    #  | Admin |
      | PM    |

  @339420
  Scenario: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserOrganizationIdFreeTextUsedADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339422
  Scenario:LWC - Flex View Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                       | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserOrganizationIdFreeTextUsedPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339427
  Scenario: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’, field should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                   | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGraterThanEqualsOrganizationIdFreeTextAdmin | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339429
  Scenario: LWC - Flex View Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ , fields should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGraterThanEqualsOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339433
  Scenario: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ & operator as ‘Less than’  should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserLessThanOrganizationIdFreeTextADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339437
  Scenario: LWC - Flex View Layout - Hide Expression Builder - PM - UI  - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’,should not display on UI for values greater than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserLessThanOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339442
  Scenario: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’, should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                              | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGreaterThanOrganizationIdFreeTextADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @339446
  Scenario: LWC - Flex View Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGreaterThanOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block

  @338882
  Scenario: LWC - Flex View Layout - Hide Expression Builder - SPI - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Applicant' as Right Operand then that field should display  Applicant users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                            | Recipient Pre-Application | Name                      | PBD-42104                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:hideExrsionBuilderPBDUsertypeNotInApplicantSPI | Recipient Pre-Application | Name                      | PBD-42104                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "Email Address" inside page block