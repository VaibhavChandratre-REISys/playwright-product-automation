@ComponentSanity @PagelayoutComponentSanity @Page1 @ComponentSanity2 @ComponentSanity2_2

Feature: Test pagelayout component

  @549610
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Queue of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForQueueInGovGrantTestQueuePM | Grantor State Program | Name                      | Test Button                |
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
    #Queue-In-GovGrantTestQueue
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                        | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForQueueNotInGovGrantTestQueuePM | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Queue-NotIn-GovGrantTestQueue
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549609
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Combination of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionCombination | Grantor State Program | Name                      | Test Button                |
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
    #Combination
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549608
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                         | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJAction3GroupCombination | Grantor State Program | Name                      | Test Button                |
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
    #3GroupCombination
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549607
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                         | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJAction2GroupCombination | Grantor State Program | Name                      | Test Button                |
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
    #2GroupCombination
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549604
  Scenario Outline: LWC - Page Layout - Admin - Action Config: Verify Hide Expression JSON - Context of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderContextInViewAction | Grantor State Program | Name                      | Test Button                |
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
    #Context-In-View
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:hideExpressionBuilderContextNotInView | Grantor State Program | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Cotext-NotIn-View
    Then I softly see "Test Button" button is displayed

    Examples:
      | User |
      | PM   |

  @549601
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Context of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:ContextInViewPostCreateApplication | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Context-In-View
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                           | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionContextNotInViewSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Cotext-NotIn-View
    Then I softly see "Test Button" button is displayed

  @549600
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJAction2GroupCombinationSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #2GroupCombination
    Then I softly do not see "Test Button" button is displayed

  @549599
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJAction3GroupCombinationSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #3GroupCombination
    Then I softly do not see "Test Button" button is displayed

  @549598
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Combination of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                      | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionCombinationSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Combination
    Then I softly do not see "Test Button" button is displayed

  @549597
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Queue of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                      | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForQueueInGovGrantTestQueueSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Queue-In-View
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                         | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForQueueNotInGovGrantTestQueueSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Queue-NotIn-View
    Then I softly see "Test Button" button is displayed

  @549596
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppInStateAsGrantorSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-UseApp-In-StateAsGrantor
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                        | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppNotInStateAsGrantorSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UseApp-NotIn-StateAsGrantor
    Then I softly do not see "Test Button" button is displayed

  @549596_1
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppInStateAsGranteeSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-UseApp-In-StateAsGrantee
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppInStateAsGranteeSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UseApp-NotIn-StateAsGrantee
    Then I softly do not see "Test Button" button is displayed

  @549596_2
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppInRecipientSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-UseApp-In-Recipient
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserAppNotInRecipientSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UseApp-NotIn-Recipient
    Then I softly see "Test Button" button is displayed

  @549595
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Profile of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                       | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForProfileInSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-Profile-In-SPI
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForProfileNotInSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-Profile-NotIn-SPI
    Then I softly see "Test Button" button is displayed

  @549594
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                 | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserTypeInApplicantSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-UserType-In-Applicant
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                    | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserTypeNotInApplicantSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserType-NotIn-Applicant
    Then I softly see "Test Button" button is displayed

  @549594_1
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserTypeInInternalSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #Field-UserType-In-Internal
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                   | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionForUserTypeNotInInternalSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #Field-UserType-NotIn-Internal
    Then I softly do not see "Test Button" button is displayed

  @549593
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - $User of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionFor$UserEqualsFirstNameAutomationSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #$User-Equals-FirstName-Automation
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                               | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionFor$UserNotEqualsFirstNameAutomationSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #$User-NotEquals-FirstName-Automation
    Then I softly see "Test Button" button is displayed

  @549592
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionFor$UserEqualsFirstNameAutomationSPI | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    #$User-Equals-FirstName-Automation
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                               | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEBJActionFor$UserNotEqualsFirstNameAutomationSPI | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "4" seconds
    #$User-NotEquals-FirstName-Automation
    Then I softly do not see "Test Button" button is displayed

  @549590
  Scenario: LWC - Page Layout - SPI - Action Config: Verify "Edit" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active              | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Standard Action        | Edit              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active              | true          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message | Test Warning  | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Standard Action        | Edit          | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    And I click on "Test Button" in the page details without processing
    And I pause execution for "3" seconds
    Then I see confirmation box with message "Test Warning" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true              | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Long | Test Warning Long | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I click on "Test Button" in the page details without processing
    Then I see confirmation box with message "Test Warning Long" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |

  @549591 @wip
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Logic of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide for Profile | SPI           | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    #Hide For Profile
    Then I softly do not see "Test Button" button is displayed
    #Hide For User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for User    |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide for Profile |               | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide for User    | Applicant     | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed
    #Hide For Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for User    |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context | View          | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @5495921
  Scenario: LWC - Page Layout - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                               | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsFundingOrgEqualsTestAutoOrg | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    #Equals To
    Then I softly do not see "Test Button" button is displayed
   #Not Equals To
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                  | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsFundingOrgNotEqualsTestAutoOrg | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    Then I softly see "Test Button" button is displayed

  @549592_1
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action - Grater Than Equals and Less Than Equals
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Layout Action                       | Is Active            | true                                                                            | Recipient ApplicationView | Name                      | Test Button                   |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsEstimatedProgramIncomeLessThanEquals2000 | Recipient ApplicationView | Name                      | Test Button                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                            | Recipient ApplicationView | Name                      | {SavedValue:Contingencies__c} |
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I enter value "2000" into field "Contingencies__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than Equals
    Then I softly do not see "Test Button" button is displayed
    #Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                       | Is Active            | true                                                                              | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsEstimatedProgramIncomeGraterThanEquals2000 | Recipient ApplicationView | Name                      | Test Button                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                              | Recipient ApplicationView | Name                      | {SavedValue:Contingencies} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @549592_2
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action -In and Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                             | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsStateInIN | Recipient ApplicationView | Name                      | Test Button                |
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    #In - State Picklist
    Then I softly do not see "Test Button" button is displayed
    #Not-In - IN State Picklist
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsStateNotInIN | Recipient ApplicationView | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed
    #Contains - US
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                  | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsStateContainIN | Recipient ApplicationView | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | Recipient ApplicationView | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed
