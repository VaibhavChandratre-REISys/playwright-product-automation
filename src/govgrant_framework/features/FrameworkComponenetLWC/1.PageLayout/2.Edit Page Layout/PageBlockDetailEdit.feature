@PageLayout @PageBlockDetailEdit @EditLayout @PageLayout2 @Layouts
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @337546 @337549
  Scenario Outline: LWC-Flex Edit Layout - Fields - UI - PM- To verify that Page block details not rendering on page block when "Is Active" checkbox is unchecked in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program | ApiGeneratedId:0 |
    #  | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor State Program | Name                      | PBD-35468                  |
    #  | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
     # | Admin |
      | PM   |

  @337550 @337556
  Scenario Outline: LWC-Flex Edit Layout - Fields - UI - PM- To verify that Page block details rendering on page block when "Is Active" checkbox is checked in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program | ApiGeneratedId:0 |
    #  | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | PBD-35468                  |
    #  | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "Website Address" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337569 @337571
  Scenario Outline: LWC-Flex Edit Layout - Fields - Config - Admin - To verify that field label is rendering on page block same as added in 'Field Label Override' in page block details config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Address   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Name Test Automation Testing From Both User | Grantor State Program | Name                      | PBD-35468                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "Website Name Test Automation Testing From Both User" inside page block
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @337573 @337575
  Scenario Outline: LWC-Flex Edit Layout - Fields - UI - PM - To verify that if user added value in 'Field Label Override (Rich Text)' in page block details config then that label is rendering on page block.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue     | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                  | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Internal Organization | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                   | Grantor State Program | Name                      | PBD-35167                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Internal Organization1 | Grantor State Program | Name                      | PBD-35167                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "Internal Organization1" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337579 @337582
  Scenario Outline: LWC-Flex Edit Layout - Fields - Config- Admin- To verify that the field is required to save record when required behavior is set to 'Required for Save' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | PBD-35403                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35403                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see asterisk mark at "Type" field in LWC
    Examples:
      | User |
     # | Admin |
      | PM   |

  @337583 @337585
  Scenario Outline:LWC-Flex Edit Layout - Fields - Config- Admin- To verify that the field is required to submit record when required behavior is set to 'Required for Submit' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I do not see asterisk mark at "Funded Amount" field in LWC
    Then I do not see required for submit symbol at "Funded Amount" field
    Examples:
      | User |
     # | Admin |
      | PM   |


  @337597 @337598
  Scenario Outline:LWC-Flex Edit Layout - Fields - Config - Admin - To verify that field label is rendering properly on page block if added long value in 'Field Label Override' in field config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Address   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true             | Grantor State Program | Name                      | PBD-35468                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Website Address1 | Grantor State Program | Name                      | PBD-35468                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see field "Website Address1" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @337601 @thisisforadminuseronly
  Scenario Outline: LWC - Flex Edit Layout - Hide Logic Fields - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that field should be hide for System Administrator profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | System Administrator | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User  |
      | ADMIN |

  @338285 @338346 @338351
  Scenario Outline: LWC - Flex Edit Layout - Hide Logic Fields - PM - UI - To verify that when user select 'PM' in 'Hide For Profile' then that fields should be hide for PM profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338336 @338344
  Scenario Outline: LWC - Flex Edit Layout - Hide Logic Fields- Admin - Config - To verify that when user select 'Edit' in 'Hide for Context' then that field should be hide for edit layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide For Context | Edit          | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    Then I cannot see field "Website Address" inside page block

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338356
  Scenario Outline:LWC - Flex Edit Layout - Hide Logic Fields - Admin - Config - To verify that when user added 'Applicant' in 'Hide For User' then that field should be hide for all applicant users..
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Grantor State Program | Name                      | PBD-35468                  |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    Then I see field "Website Address" inside page block

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @339593 @339597
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - To Verify hide expression for field can be used using Left operand as ‘Field.’
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                              | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDInternal | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
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
    And I click on "Edit" in the page details
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339600 @339612
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Internal' as Right Operand then that field should be hidden for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserTypeIn | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339659 @339663
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then that field should be hidden for edit layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                 | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextEdit | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339670 @339690
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Create' as Right Operand then that field should be hidden for create layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | Grantor State Program Create | Name                      | PBD-42139                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextCreate | Grantor State Program Create | Name                      | PBD-42139                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339697
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then that field should be hidden for State As Grantor app.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserAppGrantor | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339764
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then that field should be hidden for all users except Internal user..
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserTypeNotInInternal | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @337090 @339791
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then that field should be hidden for all layouts except edit layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextNotInInternal | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339793
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then that field should be hidden for all layouts except create layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                               | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                        | Grantor Master Terms and Conditions | Name                      | PBD-32997                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDContextNotInCreate | Grantor Master Terms and Conditions | Name                      | PBD-32997                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:termsAndConditionsTableId---"
    Then I see field "Legislative/Managment Reference" inside page block
    When I enter "TermsNConditions" values from "Program_Field_Values_LWC_org.xlsx"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    Then I cannot see field "Legislative/Managment Reference" inside page block

    Examples:
      | Users |
      | Admin |

  @339795 @339797
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then that field should be hidden except State As Grantor app
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserAppNotInInternal | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339799 @339862
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then that field should be hidden except State As Grantee app.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserAppNotInGrantee | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @339870 @339871
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin- Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDOROperatorUsedForEmail | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339872 @339873 @339874 @339875
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin- Config - To Verify if we configure multiple hide expressions separated by ‘AND’  operator
  LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure multiple hide expressions on same time
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDANDOperatorUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339876 @339877
  Scenario Outline:LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘Contains’ that field should not display on UI for values in right operand.
  LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - To Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘Contains’ that field should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserContainsFieldUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339927 @339929
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘In’ that field should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
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
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339945 @339947
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Not In’ that field should display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsNOTInFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Grantor State Program | Name                      | {pagelayout:PicklistTypeField}    |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Formula Grants" into field "Type__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339951 @339954
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Equals’ that field should not display on edit layout for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
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
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339957 @339958
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Not Equals’ that field should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsNOTEQUALSFreeTextUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Grantor State Program | Name                      | {pagelayout:TextField_Abbreviation} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
   # And I pause execution for "10" seconds
    And I enter value "ABC" into field "Abbreviation__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I see field "Email Test" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @339960
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’,field should not display on UI for values greater than value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                          | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserOrganizationIdFreeTextUsedADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                          | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @339961
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’,field should not display on UI for values greater than value in right operand
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
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340000 @340011
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ should not display on UI for values lesser than value in right operand
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
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    Then I cannot see field "Funded Amount" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340012 @340013
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’, field should not display on UI for values greater than to the value in right operand
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
    And I enter value "2000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Funded Amount" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340016 @340017
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                   | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                   | Grantor State Program | Name                      | {pagelayout:TextField_Abbreviation}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDFieldsGreaterThanFreeTextUsed | Grantor State Program | Name                      | {pagelayout:TextField_Abbreviation}     |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Abbreviation" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340023 @340025
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘Field’ and operator as ‘Contains’ that field should not display on UI for values in right operand
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
    And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340029 @340031
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘In’ that field should not display on UI for values in right operand.
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
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block
    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340032 @340033
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Not In’ that field should display on UI for values in right operand.
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
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    #And I enter value "vrush@gmail.com" into field "Email_Test__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    Then I see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340034 @340036
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Equals’ that field should not display on UI for values in right operand.
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
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

    Examples:
      | Users |
   #   | Admin |
      | PM    |

  @340037
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
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
    When I pause execution for "4" seconds
    And I enter value "4000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I see field "Email Test" inside page block

  @340040
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
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
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "Email Test" inside page block

  @340042
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGraterThanEqualsOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340041
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                   | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGraterThanEqualsOrganizationIdFreeTextAdmin | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340043
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than equals to the value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserLessThanOrganizationIdFreeTextADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340047
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                        | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserLessThanOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340048
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                              | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGreaterThanOrganizationIdFreeTextADMIN | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340049
  Scenario: LWC - Flex Edit Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                           | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExrsionBuilderPBD$UserGreaterThanOrganizationIdFreeTextPM | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    Then I cannot see field "Email Test" inside page block

  @340051 @340052
  Scenario Outline: LWC - Flex Edit Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any field using Left operand as ‘$ User’ and operator as ‘Contains’ that field should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBD$UserContainsFieldUsed | Grantor State Program | Name                      | {pagelayout:EmailField_EmailTest} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I cannot see field "Email Test" inside page block

    Examples:
      | User |
   #   | Admin |
      | PM   |
