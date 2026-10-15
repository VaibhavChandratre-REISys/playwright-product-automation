@HideJasonAction @neetaFlexGridLwc @flexgrid
Feature: Hide jason action scenarios

  @310292 @310300 @310302 @310303 @310348 @310352 @310361 @310366
  Scenario Outline: LWC-E-grid-Parent_Config View_Admin_To verify when user hover on View action then Action Name should be display same as mentioned in config
  |LWC-E-grid-Parent_Config View_PM_To verify when user hover on View action then Action Name should be display same as mentioned in config|
  |LWC-E-grid-Child_Config View_Admin_To verify when user hover on View action then Action Name should be display same as mentioned in config|
  |LWC-E-grid-Child_Config View_PM_To verify when user hover on View action then Action Name should be display same as mentioned in config|
  |LWC-E-grid-Parent_UI/UX View_Admin_To verify when user click on View action then user should get redirected to record view page|
  |LWC-E-grid-Parent_UI/UX View_PM_To verify when user click on View action then user should get redirected to record view page|
  |LWC-E-grid-Child_UI/UX View_Admin_To verify when user click on View action then user should get redirected to record view page|
  |LWC-E-grid-Child_UI/UX View_PM_To verify when user click on View action then user should get redirected to record view page|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    #310361 #310366 #310348 #310352 #310292 #310300
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Check" in flex table with id "---announcement:-:ConfigTableId---"
    #310302 #310303
    And I expand nested table containing column value "Check"
    Then I softly can see row level action button "View" against "Automation Data" in flex table with id "---announcement:-:ConfigTableId2---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @310421 @310427 @310432 @310435 @310443 @310451 @310457 @310471 @310491 @310492
  Scenario Outline: LWC-E-grid-Parent_Config View_Admin_To verify hide View action as per hide expression for Users in config
  |LWC-E-grid-Parent_Config View_PM_To verify hide View action as per hide expression for Users in config|
  |LWC-E-grid-Child_Config View_Admin_To verify hide View action as per hide expression for Users in config|
  |LWC-E-grid-Child_Config View_PM_To verify hide View action as per hide expression for Users in config|
  |LWC-E-grid-Parent_Config View_Admin_To verify hide View action as per hide expression for Apps in config|
  |LWC-E-grid-Parent_Config View_PM_To verify hide View action as per hide expression for Apps in config|
  |LWC-E-grid-Child_Config View_Admin_To verify hide View action as per hide expression for Apps in config|
  |LWC-E-grid-Child_Config View_PM_To verify hide View action as per hide expression for Apps in config|
  |LWC-E-grid-Parent_Config View_Admin_To verify hide View action as per hide expression for Context in config|
  |LWC-E-grid-Parent_Config View_PM_To verify hide View action as per hide expression for Context in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 | TestAutomationFlexTable7 | Name                      | View                       |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:1 | TestAutomationFlexTable8 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:2 | TestAutomationFlexTable7 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:3 | TestAutomationFlexTable8 | Name                      | View                       |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                     | TestAutomationFlexTable7 | Name                      | View                        |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForUserTypeInternalParent | TestAutomationFlexTable7 | Name                      | View                       |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "View" against "Check" in flex table with id "---announcement:-:ConfigTableId---"
    #310432 #310435
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                    | TestAutomationFlexTable8 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForUserTypeInternalChild | TestAutomationFlexTable8 | Name                      | View                       |
    And I refresh the page
    And I wait for "3" seconds
    And I expand nested table containing column value "Check"
    Then I softly cannot see row level action button "View" against "Automation Data" in flex table with id "---announcement:-:ConfigTableId2---"
    #310443 #310451
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                    | TestAutomationFlexTable7 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForUserAppInternalParent | TestAutomationFlexTable7 | Name                      | View                       |
    And I refresh the page
    And I wait for "3" seconds
    Then I softly cannot see row level action button "View" against "Check" in flex table with id "---announcement:-:ConfigTableId---"
     #310457 #310471
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                    | TestAutomationFlexTable8 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForUserAppInternalChild | TestAutomationFlexTable8 | Name                      | View                       |
    And I refresh the page
    And I wait for "3" seconds
    Then I softly cannot see row level action button "View" against "Automation Data" in flex table with id "---announcement:-:ConfigTableId2---"
     #310491 #310492
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                    | TestAutomationFlexTable7 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForContextInternalParent | TestAutomationFlexTable7 | Name                      | View                       |
    And I refresh the page
    And I wait for "3" seconds
    Then I softly cannot see row level action button "View" against "Check" in flex table with id "---announcement:-:ConfigTableId---"
     #310457 #310471
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | Row               | ApiGeneratedId:0 | TestAutomationFlexTable8 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 | TestAutomationFlexTable8 | Name                      | View                       |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location             | --None--                                                   | TestAutomationFlexTable8 | Name                      | View                       |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HETActionLevelViewForContextInternalChild | TestAutomationFlexTable8 | Name                      | View                       |
    And I refresh the page
    And I wait for "3" seconds
    Then I softly cannot see row level action button "View" against "Automation Data" in flex table with id "---announcement:-:ConfigTableId2---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |
