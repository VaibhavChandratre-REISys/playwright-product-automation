@HideJasonAction @neetaFlexGridLwc @flexgrid @FlexGrid
Feature: Hide jason action scenarios

  @330870 @330882 @330974 @330976
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying hide json by selecting LO - User type, Operator - IN and RO - All (Applicant, Internal, Reviewer)
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying hide json by selecting LO - User type, Operator - IN and RO - All (Applicant, Internal, Reviewer)|
  |LWC-E-grid-HideAction_Admin_To verify that action not get hide for all user types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - All (Applicant, Internal, Reviewer)
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for all user types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - All (Applicant, Internal, Reviewer)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                              | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButton | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #330974 #330976
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                   | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @330883 @330978
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying hide json by selecting LO - User type, Operator - IN and RO - All (Applicant, Internal, Reviewer)
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for all user types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - All (Applicant, Internal, Reviewer) |
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
#      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
#      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName                  | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Flex Table Action     | Header Action Display Type | --None--                              | TestAutomationFlexTable7 | Name                      | New                        |
#      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButton | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #330974
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | None                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @330885 @330889 @330980 @330982 @330986 @331053
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide for applicant only, on applying hide json by selecting LO - User type, Operator - IN and RO - Applicant
  |LWC-E-grid-HideAction_PM_To verify that action get hide for applicant only, on applying hide json by selecting LO - User type, Operator - IN and RO - Applicant|
  |LWC-E-grid-HideAction_Admin_To verify that action not get hide for Applicant user type and get hide for Internal and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Applicant|
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for Applicant user type and get hide for Internal and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Applicant|
  |LWC-E-grid-HideAction_Admin_To verify that action not get hide for Internal user type and get hide for Applicant and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Internal|
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for Internal user type and get hide for Applicant and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Internal|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #330980 #330982
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAppNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #330986 #331053
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForIntNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @330890 @330983 @331054
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide for applicant only, on applying hide json by selecting LO - User type, Operator - IN and RO - Applicant
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Applicant user type and get hide for Internal and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Applicant|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Internal user type and get hide for Applicant and Reviewer types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Internal|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #330983
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAppNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331054
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForIntNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @330962 @330963 @331055 @331056
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide for Internal user only, on applying hide json by selecting LO - User type, Operator - IN and RO - Internal
  |LWC-E-grid-HideAction_PM_To verify that action get hide for Internal user only, on applying hide json by selecting LO - User type, Operator - IN and RO - Internal|
  |LWC-E-grid-HideAction_Admin_To verify that action not get hide for Reviewer user type and get hide for Internal and Applicant types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Reviewer|
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for Reviewer user type and get hide for Internal and Applicant types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Reviewer|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInt | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331055 #331056
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForRevNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @330964 @331057
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide for Internal user only, on applying hide json by selecting LO - User type, Operator - IN and RO - Internal
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Reviewer user type and get hide for Internal and Applicant types, on applying hide json by selecting LO - User type, Operator - NOT IN and RO - Reviewer|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInt | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331057
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForRevNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331058 @331060
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying hide json by selecting LO - Profile, Operator - IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND)
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying hide json by selecting LO - Profile, Operator - IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND) |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAllProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @331061 @331084 @331089 @331092 @331095
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying hide json by selecting LO - Profile, Operator - IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND)
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND)|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Admin profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for PM profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - PM|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for SPI profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - SPI|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAllProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331084
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInAllProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331089
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331092
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331095
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331107 @331110 @331114 @331127 @363647 @363651 @363658
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action not get hide for Admin and PM profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Admin and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, SPI|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO -  PM, SPI|
  |LWC-E-grid-HideAction_SPI_To verify that action not get hide for Admin, PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM, SPI|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - In, respective action get hide on View page layout only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - Not In, respective action not get hide on View page layout only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Context and selecting RO - View, Edit and Operator - Not In, respective action not get hide on Edit and View page layout|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdmPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331110
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdmSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331114
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331127
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363647
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                              | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInContextView | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363651
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                 | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInContextView | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363658
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                     | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInContextViewEdit | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"


  @363631 @363689 @363686 @363682 @363678 @363692 @363661
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying hide json by selecting LO - Context and selecting RO - Create, Edit and View and Operator - In
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - Not In,  respective action not get hide for SPI User only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - Not In,  respective action not get hide for Admin and PM only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - In,  respective action get hide for Admin and PM users only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - In, respective action get hide for SPI user only|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - UserApp and selecting RO - All Userapps and Operator - Not In,  respective action not get hide for all user apps|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                      | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInContextEditViewCrea | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363689
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInSPIUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363686
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInStateAsGrantor | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363682
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                 | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInStateAsGrantor | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
   #363678
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInSPIUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363692
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInAllUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363661
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInAllUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331064
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action get hide for Admin only, on applying hide json by selecting LO - Profile, Operator - IN and RO - System Administrator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331065
  Scenario: LWC-E-grid-HideAction_PM_To verify that action get hide for Admin only, on applying hide json by selecting LO - Profile, Operator - IN and RO - System Administrator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331066 @331069 @331072
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide for Admin only, on applying hide json by selecting LO - Profile, Operator - IN and RO - System Administrator
  |LWC-E-grid-HideAction_SPI_To verify that action get hide for PM only, on applying hide json by selecting LO - Profile, Operator - IN and RO - PM|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide for SPI only, on applying hide json by selecting LO - Profile, Operator - IN and RO - SPI|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331069
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #331072
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331067
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action get hide for PM only, on applying hide json by selecting LO - Profile, Operator - IN and RO - PM
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331068
  Scenario: LWC-E-grid-HideAction_PM_To verify that action get hide for PM only, on applying hide json by selecting LO - Profile, Operator - IN and RO - PM
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331070
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action get hide for SPI only, on applying hide json by selecting LO - Profile, Operator - IN and RO - SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331071
  Scenario: LWC-E-grid-HideAction_PM_To verify that action get hide for SPI only, on applying hide json by selecting LO - Profile, Operator - IN and RO - SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331087
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action not get hide for Admin profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331088
  Scenario: LWC-E-grid-HideAction_PM_To verify that action not get hide for Admin profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdminProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331093
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action not get hide for SPI profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331094
  Scenario: LWC-E-grid-HideAction_PM_To verify that action not get hide for SPI profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                          | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331090
  Scenario: LWC-E-grid-HideAction_Admin_To verify that action not get hide for PM profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - PM
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331091
  Scenario: LWC-E-grid-HideAction_PM_To verify that action not get hide for PM profile and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - PM
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @331105 @331106
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action not get hide for Admin and PM profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for Admin and PM profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdmPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @331108
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action not get hide for Admin and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdmSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User  |
      | ADMIN |

  @331109
  Scenario Outline: LWC-E-grid-HideAction_PM_To verify that action not get hide for Admin and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInAdmSPIProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |

  @331111
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action not get hide for PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO -  PM, SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User  |
      | ADMIN |

  @331112
  Scenario Outline: LWC-E-grid-HideAction_PM_To verify that action not get hide for PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO -  PM, SPI
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonNotInSPIPMProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |

  @331082 @331083
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action not get hide, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND)
  | LWC-E-grid-HideAction_PM_To verify that action not get hide, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - All (EXE,FD,FO,PM,PO,SME,SPA,SPI,System Administrator,Auditor,IND)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInAllProf | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User  |
      | ADMIN |
      | PM    |

  @331125 @331126
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action not get hide for Admin, PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM, SPI
  |LWC-E-grid-HideAction_PM_To verify that action not get hide for Admin, PM and SPI profiles and get hide for all other profiles, on applying hide json by selecting LO - Profile, Operator - NOT IN and RO - System Administrator, PM, SPI|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                              | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInAdmPMSPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363627 @363628
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying hide json by selecting LO - Context and selecting RO - Create, Edit and View and Operator - In
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying hide json by selecting LO - Context and selecting RO - Create, Edit and View and Operator - In|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                      | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInContextEditViewCrea | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363644 @363646
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - In, respective action get hide on View page layout only
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - In, respective action get hide on View page layout only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                              | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInContextView | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363648 @363649
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - Not In, respective action not get hide on View page layout only
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Context and selecting RO - View and Operator - Not In, respective action not get hide on View page layout only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                 | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInContextView | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363656 @363657
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Context and selecting RO - View, Edit and Operator - Not In, respective action not get hide on Edit and View page layout
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Context and selecting RO - View, Edit and Operator - Not In, respective action not get hide on Edit and View page layout|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                     | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInContextViewEdit | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363634 @363636 @363652 @363653
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - In, respective action get hide on Edit page layout only
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - In, respective action get hide on Edit page layout only|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - Not In, respective action not get hide on Edit page layout only|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - Not In, respective action not get hide on Edit page layout only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                              | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInContextEdit | TestAutomationFlexTable7 | Name                      | New                        |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #363652 #363653
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                 | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInContextEdit | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363659 @363660 @363690 @363691
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - All Userapps and Operator - In, respective action get hide for all user apps i.e. Recipient, Admin, StateasGrantor, StateasGrantee
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - All Userapps and Operator - In, respective action get hide for all user apps i.e. Recipient, Admin, StateasGrantor, StateasGrantee|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - All Userapps and Operator - Not In,  respective action not get hide for all user apps|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - All Userapps and Operator - Not In,  respective action not get hide for all user apps|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInAllUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363690 #363691
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInAllUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363675 @363676 @363687 @363688
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - In, respective action get hide for SPI user only
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - In, respective action get hide for SPI user only|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - Not In,  respective action not get hide for SPI User only|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - Recipient and Operator - Not In,  respective action not get hide for SPI User only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                             | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInSPIUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363687 #363688
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInSPIUserApp | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363679 @363680 @363683 @363684
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - In,  respective action get hide for Admin and PM users only
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - In,  respective action get hide for Admin and PM users only|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - Not In,  respective action not get hide for Admin and PM only|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - UserApp and selecting RO - StateasGrantor and Operator - Not In,  respective action not get hide for Admin and PM only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                 | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForInStateAsGrantor | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #363683 #363684
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForNotInStateAsGrantor | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @363639 @363654
  Scenario: LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - In, respective action get hide on Edit page layout only
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Context and selecting RO - Edit and Operator - Not In, respective action not get hide on Edit page layout only |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                            | TestAutomationFlexTable4 | Name                      | TestButton                 |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForSPIInEdit | TestAutomationFlexTable4 | Name                      | TestButton                 |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    Then I cannot see top right button "TestButton" in flex table with id "---announcement:-:ConfigTableId1---"
     #363654
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                               | TestAutomationFlexTable4 | Name                      | TestButton                 |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForSPINotInEdit | TestAutomationFlexTable4 | Name                      | TestButton                 |
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "History" sub tab
    Then I can see top right button "TestButton" in flex table with id "---announcement:-:ConfigTableId1---"

  @364207 @364208
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator - Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator - Equals, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                   | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                          | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextEquals | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364211 @364212
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Not Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Not Equals, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                      | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                             | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextNotEquals | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364214 @364217
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than Equals, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                       | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                              | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextLessEquals | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364220 @364221
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than Equals, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                          | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                                 | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextGreaterEquals | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364223 @364224
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                             | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                    | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeLess | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364240 @364243
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                       | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeGreater | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364245 @364246
  Scenario Outline:  LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  IN, then respective action get hide when condition is true
  | LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  IN, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                  | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeIn | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364248 @364249 @364516 @364517
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  NOT IN, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  NOT IN, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Lookup"and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Lookup"and RO - FreeText and action gets hide for given condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                              | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                     | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeNotIn | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    #364516 #364517
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeLookup | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364251 @364252 @364492 @364493 @364495 @364496
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  CONTAINS, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  CONTAINS, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Number" and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Number" and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Percent"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Percent"  and RO - FreeText and action gets hide for given condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                             | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                    | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeCont | AnnouncementReviewTemplates | Name                      | TestFlexGrid               |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    #364492 #364493
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                    | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeNumber | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "AutomationTest" in flex table with id "---announcement:-:ReviewStepsTableId---"
     #364495 #364496
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                     | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreePercent | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "AutomationTest" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364256 @364257 @364277 @364283 @364489 @364490
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text" and RO - FreeText and action gets hide for given condition
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text" and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Picklist"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Picklist"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Currency"   and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Currency"  and RO - FreeText and action gets hide for given condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                             | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                    | ProgramReviewStepTemplates | Name                      | AutomationTest             |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeText | ProgramReviewStepTemplates | Name                      | AutomationTest             |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "Automation Permanent Internal Program" in "{program:programsTableId}" panel
    When I click on "View" icon for "Automation Permanent Internal Program" inside table
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "AutomationTest" in flex table with id "---announcement:-:ReviewStepsTableId---"
    #364277 #364283
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                      | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreePicklist | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "AutomationTest" in flex table with id "---announcement:-:ReviewStepsTableId---"
    #364489 #364490
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                      | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeCurrency | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "AutomationTest" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @364209 @364213 @364218 @364222 @364226
  Scenario: LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator - Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Not Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Less than, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #364213
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                           | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextNotEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364218
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                            | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextLessEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364222
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                               | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextGreaterEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364226
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                  | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeLess | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @364244 @364247 @364250 @364255
  Scenario: LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  Greater than, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  IN, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  NOT IN, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_SPI_To verify that on applying hide json by selecting LO - Field and RO - Freetext and provided value of respective field in RO and operator -  CONTAINS, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                     | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeGreater | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #364247
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364250
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                   | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeNotIn | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364255
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                  | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeCont | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @364258 @364261 @364286 @364491 @364494 @364497 @364518
  Scenario: LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text"  and RO - FreeText and action gets hide for given condition
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text Area"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Picklist" and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Currency"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Number" and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Percent"  and RO - FreeText and action gets hide for given condition|
  |LWC-E-grid-HideAction_SPI_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Lookup"and RO - FreeText and action gets hide for given condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                     | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextSPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
#    #364261
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
#      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
#      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Flex Table Action     | Header Action Display Type | --None--                                                      | TestAutomationFlexTable7 | Name                      | New                        |
#      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextArea | TestAutomationFlexTable7 | Name                      | New                        |
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364286
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreePicklistSPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364491
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                         | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeCurrencySPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
     #364494
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeNumberSPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #364497
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    #364518
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                       | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeLookupSPI | TestAutomationFlexTable7 | Name                      | New                        |
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"

  @364259 @364260
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text Area"  and RO - FreeText and action gets hide for given condition
  |LWC-E-grid-HideAction_PM_To verify that action get hide, on applying Hide expression Json by selecting LO - Field of data type "Text Area" and RO - FreeText and action gets hide for given condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | --None--          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button                                                        | ProgramReviewStepTemplates | Name                      | AutomationTest             |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeTextArea | ProgramReviewStepTemplates | Name                      | AutomationTest             |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Test Data" into field "AutTestName1__c"
    When I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    Then I cannot see top right button "TestFlexGrid" in flex table with id "---announcement:-:ReviewStepsTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @365341 @365342 @365478 @365479 @365522 @365526 @365530 @365531
  Scenario Outline: LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - $User and selected appropriate fields and operator - Equals, then respective action get hide when condition is true
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - $User and selected appropriate fields and operator - Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - Field and RO - $User and selected appropriate fields and operator - NOT Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - Field and RO - $User and selected appropriate fields and operator - NOT Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - $User and RO - Freetext and provided value of respective field in RO and operator - Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - $User and RO - Freetext and provided value of respective field in RO and operator - Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_Admin_To verify that on applying hide json by selecting LO - $User and RO - Freetext and provided value of respective field in RO and operator -  Not Equals, then respective action get hide when condition is true|
  |LWC-E-grid-HideAction_PM_To verify that on applying hide json by selecting LO - $User and RO - Freetext and provided value of respective field in RO and operator -  Not Equals, then respective action get hide when condition is true|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | --None--                                                        | TestAutomationFlexTable7 | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeUserEquals | TestAutomationFlexTable7 | Name                      | New                        |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    #365522 #365526
    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
#      #365478 #365479 #365530 #365531
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
#      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
#      | Flex Table Action     | Hide Expression JSON       |                   | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName                  | fieldNewValue                                                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Flex Table Action     | Header Action Display Type | --None--                                                           | TestAutomationFlexTable7 | Name                      | New                        |
#      | Flex Table Action     | Hide Expression JSON       | govgrants_config:HETActionLevelButtonForLOFieldROFreeUserNotEquals | TestAutomationFlexTable7 | Name                      | New                        |
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I cannot see top right button "New" in flex table with id "---announcement:-:ConfigTableId---"
    Examples:
      | User |
      | PM   |
#      | ADMIN |
