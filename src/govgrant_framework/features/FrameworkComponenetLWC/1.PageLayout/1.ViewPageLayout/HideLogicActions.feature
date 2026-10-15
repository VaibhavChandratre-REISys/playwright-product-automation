@PageLayout @HideLogic @ViewLayout @PageLayout1
Feature: Page Layout Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @328089 @328090
  Scenario Outline: LWC - Flex View Layout - Hide Logic - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that action should be hide for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active     | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide For User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active     | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide For User | Internal      | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed
    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @326873
  Scenario: LWC - Flex View Layout - Hide Logic - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that action should be hide for System Administrator profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active     | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide For User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active     | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide For User | Internal      | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

  @326889
  Scenario: LWC - Flex View Layout - Hide Logic - PM - Config - To verify that when user select 'PM' in 'Hide For Profile' then that action should be hide for PM profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Profile | PM            | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

  @326948 @306949
  Scenario Outline: LWC - Flex View Layout - Hide Logic - Admin - Config - To verify that when user select 'View' in 'Hide for Context' then that action should be hide for view layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context | View          | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @326995 @326996
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Internal' as Right Operand then action should be hidden for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for Context     |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                           | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserTypeInInternalAction | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context     |                                                                | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327175 @327176
  Scenario Outline:LWC - Flex View Layout - Hide Expression Builder - Admin/PM - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then action should be hidden for view layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderContextInViewAction | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327284 @327285
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then action should be hidden for State As Grantor app
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppInStateAsGrantor | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327315 @327326
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then action should be display for Internal users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserTypeNotInInternal | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327383 @327384
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then action should be hidden for all layouts except view layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderContextNotInView | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327385 @327386
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then action should be hidden for all layouts except edit layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderContextNotInEdit | Grantor State Program | Name                      | Test Button                |
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
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @327389 @327401
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then action should be hidden except State As Grantor app
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                             | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppNotInStateAsGrantor | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @337363 @337366
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  operator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppInGrantorANDContextInView | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337371 @337372 @337377 @337378 @re
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderUserAppNotInGrantorORContextInView | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    #And I click on "Save" in the page details
    And I pause execution for "10" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337476 @337477
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘Contains’ that action should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameContainsFreeTextAutomation | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337490 @337492
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - To Verify hide expression for actions can be used using Left operand as ‘Field’
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                    | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFocusAresEqualsFreeTextNo | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "10" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337559 @337562 @re
  Scenario Outline:LWC - Flex View Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘Field’ and operator as ‘In’ that action should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                 | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFocusAresInFreeTextYes | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337634 @337635
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘Field’ and operator as ‘Not In’ that action should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                         | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldTypeNotInFreeTextProjectGrants | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337712 @337714
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘Field’ and operator as ‘Not Equals’ that action should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                             | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldTypeNotEqualsFreeTextProjectGrants | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337790 @337798
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expresion using Left operand as ‘Field’ and operator as ‘Less than equals’ action should not display on UI for values greater than equals value inright operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | false             | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                 | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                                 | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFundedAmountLessThanEqualsFreeText3000 | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337845 @337847
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin-Config - Verify if we configure hide expresin using Left operand as ‘Field’ and operator as ‘Greater than equals’ action should not display on UI for values lesser than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | false             | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                  | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                                  | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFundedAmountGrterThanEqualsFreeText2999 | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337929 @337930
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ action should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | false             | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                           | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                           | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFundedAmountLessThanFreeText3001 | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337951 @337952
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | false             | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                              | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                              | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFundedAmountGreaterThanFreeText2999 | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337957 @337959
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘Field’ and operator as ‘Contains’ that action should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                            | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldTypeContainsFreeTextProjectGrants | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337987 @337988
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘In’ that action should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                    | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameInFreeTextAutomation | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337990 @337991
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘Not In’ that action should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                       | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameNotInFreeTextAutomation | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @337997 @337998
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any action using Left operand as ‘$ User’ and operator as ‘Equals’ that action should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338001
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                           | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDLessThanEqualsFreeTextADMIN | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User  |
      | ADMIN |

  @338002
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ should not display on UI for values greater than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDLessThanEqualsFreeTextPM | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @338008
  Scenario Outline: LWC - Flex View Layout-HideExpression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ should not display on UI for values lesser than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                              | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDGreaterThanEqualsFreeTextADMIN | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User  |
      | ADMIN |

  @338009
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                           | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDGreaterThanEqualsFreeTextPM | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @338010
  Scenario Outline:LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDLessThanFreeTextADMIN | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User  |
      | ADMIN |

  @338011 @re
  Scenario Outline:LWC - Flex View Layout - Hide Expression Builder - PM - UI  - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                  | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDLessThanFreeTextPM | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @338016
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | false             | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExrsionBuilderAction$UserAccIDGreaterThanFreeTextADMIN | Grantor State Program | Name                      | Test Button                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User  |
      | ADMIN |

  @338017
  Scenario Outline: LWC - Flex View Layout - Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:1 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                 | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Layout Action                       | Is Active            | true                                                                                 | Grantor State Program | Name                      | Test Button                             |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:hideExrsionBuilderActionFieldFundedAmountLessThanEqualsFreeText3000 | Grantor State Program | Name                      | Test Button                             |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I pause execution for "5" seconds
    Then I do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |