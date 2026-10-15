@DeleteAction @flexgrid @FlexGrid
Feature: Delete Action Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  Background:
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Is Active | true              | ApiGeneratedId:0 |
      | Page Block            | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Grantor State Program     | Name                      | PB-13952                   |
      | Page Block:Page Block Detail | Is Active | true          | Recipient Pre-Application | Name                      | PB-13960                   |


  @309321 @309322 @309330 @309329
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify that when user click on 'Delete' action then Confirmation box should be display.
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify that when user click on 'Delete' action then Confirmation box should be display.|
  |LWC-E-grid-Child_UI/UX Delete_Admin_To verify that when user click on 'Delete' action then Confirmation box should be display.|
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify that when user click on 'Delete' action then Confirmation box should be display.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I click on "Delete" action for first record of table
    #309321 #309322
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on "Delete" action for first record of table
    #309330 #309329
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309349 @309364  @309386 @309387 @309367 @309368 @309392 @309391
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify that when user click on 'Cancel' button on confirmation box then Confirmation box should be closed.
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify that when user click on 'Cancel' button on confirmation box then Confirmation box should be closed.|
  |LWC-E-grid-Parent_UI/UX Delete_Admin_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
  |LWC-E-grid-Child_UI/UX Delete_Admin_To verify that when user click on 'Cancel' button on confirmation box then Confirmation box should be closed.|
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify that when user click on 'Cancel' button on confirmation box then Confirmation box should be closed.|
  |LWC-E-grid-Child_UI/UX Delete_Admin_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I click on "Delete" action for first record of table
        #309386 #309387
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Cancel" on modal confirmation box
      #309349 #309364
    Then I softly do not see confirmation box with header "Confirm" is displayed
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on "Delete" action for first record of table
     #309392 #309391
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Cancel" on modal confirmation box
      #309367 #309368
    Then I softly do not see confirmation box with header "Confirm" is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309404 @309405
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify that when user click on 'OK' button on confirmation box then record should get deleted successfully
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify that when user click on 'OK' button on confirmation box then record should get deleted successfully|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Flex Grid             | Enable Quick Search | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Grid:General     | Enable Quick Search | true          | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description | Step Name      | Step Weight (%) |
      | 4          | Test        | Review Testing | 0               |
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    When I click on "Delete" icon for "4" inside table
    And I click "OK" on modal confirmation box
    Then I see the following message in the page details :
      | Record deleted successfully. |

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309409 @309411
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify that when user click on 'OK' button on confirmation box then record should get deleted successfully
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify that when user click on 'OK' button on confirmation box then record should get deleted successfully|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Flex Grid             | Enable Quick Search | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Grid:General     | Enable Quick Search | true          | ProgramReviewStepPanelTemplates |                           |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "1"
    And I pause execution for "4" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    And I see the following message in the page details :
      | Saved Successfully! |
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    When I click on "Delete" icon for "50.00%" inside table
    And I click "OK" on modal confirmation box
    Then I see the following message in the page details :
      | Record deleted successfully. |
    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309442 @309446
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify count of 'Total Records' on table when user deleted the records.
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify count of 'Total Records' on table when user deleted the records.|
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    Then I see Total Records count "Total Records: 3" in table name "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description | Step Name      | Step Weight (%) |
      | 4          | Test        | Review Testing | 0               |
    And I pause execution for "4" seconds
    Then I see Total Records count "Total Records: 4" in table name "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    When I click on "Delete" icon for "4" inside table
    And I click "OK" on modal confirmation box
    And I pause execution for "3" seconds
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see Total Records count "Total Records: 3" in table name "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309454 @309464
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify count of 'Total Records' on child table when user deleted the records.
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify count of 'Total Records' on child table when user deleted the records.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Grid             | Enable Total Records Count | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Grid:General     | Enable Total Records Count | true          | ProgramReviewStepPanelTemplates |                           |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    Then I see ">" button in table name "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I expand nested table containing column value "1"
    And I pause execution for "3" seconds
    Then I see Total Records count "Total Records: 1" in table name "---flexgrid:-:ProgramReviewStepChildTableId---"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    And I see Total Records count "Total Records: 2" in table name "---flexgrid:-:ProgramReviewStepChildTableId---"
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    When I click on "Delete" icon for "50.00%" inside table
    And I click "OK" on modal confirmation box
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see Total Records count "Total Records: 1" in table name "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309325 @309334
  Scenario: LWC-E-grid-Parent_UI/UX Delete_SPI_To verify that when user click on 'Delete' action then Confirmation box should be display.
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify that when user click on 'Delete' action then Confirmation box should be display.|
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I click on "Delete" action for first record of table
      #309325
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on "Delete" action for first record of table
    #309334
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed

  @309365 @3309369 @309388 @309394
  Scenario: LWC-E-grid-Parent_UI/UX Delete_SPI_To verify that when user click on 'No' button on confirmation box then Confirmation box should be closed.
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify that when user click on 'Cancel' button on confirmation box then Confirmation box should be closed.|
  |LWC-E-grid-Parent_UI/UX Delete_SPI_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify that user see 'Cancel' and 'OK' buttons on Confirmation box|
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I click on "Delete" action for first record of table
        #309365 #309388
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Cancel" on modal confirmation box
    Then I softly do not see confirmation box with header "Confirm" is displayed
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on "Delete" action for first record of table
     #309369 #309394
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Cancel" on modal confirmation box
    Then I softly do not see confirmation box with header "Confirm" is displayed

  @309506 @309508 @309566 @309578
  Scenario Outline: LWC-E-grid-Parent_Config Delete_Admin_To verify pop up the confirmation box when user click on 'Delete' action if 'Show Confirmation Box' is enable in action config
  |LWC-E-grid-Parent_Config Delete_PM_To verify pop up the confirmation box when user click on 'Delete' action if 'Show Confirmation Box' is enable in action config|
  |LWC-E-grid-Parent_Config Delete_Admin_To verify confirmation message rendering on confirmation box same as in config|
  |LWC-E-grid-Parent_Config Delete_PM_To verify confirmation message rendering on confirmation box same as in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table Action     | Show Confirmation Box | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message  |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Show Confirmation Box | true          | ProgramReviewStepTemplates | Name                      | Delete                     |
      | Flex Table Action     | Confirmation Message  | Automation    | ProgramReviewStepTemplates | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | 4          | Test Description | Test      | 0               | 1           |
    And I pause execution for "4" seconds
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    And I click on "Delete" icon for "4" inside table without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Automation" is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309511 @309514 @309580 @308581
  Scenario Outline:LWC-E-grid-Child_Config Delete_Admin_To verify pop up the confirmation box when user click on 'Delete' action if 'Show Confirmation Box' is enable in action config
  |LWC-E-grid-Child_Config Delete_PM_To verify pop up the confirmation box when user click on 'Delete' action if 'Show Confirmation Box' is enable in action config|
  |LWC-E-grid-Child_Config Delete_Admin_To verify confirmation message rendering on confirmation box same as in config|
  |LWC-E-grid-Child_Config Delete_PM_To verify confirmation message rendering on confirmation box same as in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Show Confirmation Box | true                                                             | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message  | Do you want to delete? Once it is deleted it cannot be restored. | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Show Confirmation Box | true          | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
      | Flex Table Action     | Confirmation Message  | Automation    | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    And I click on "Delete" icon for "Test" inside table without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Automation" is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309522 @309525
  Scenario Outline: LWC-E-grid-Parent_Config Delete_Admin_To verify confirmation box should popup with, Confirmation Message, when user click on 'Delete' action if 'Show Confirmation Box' is disable in action config
  |LWC-E-grid-Parent_Config Delete_PM_To verify confirmation box should popup with, Confirmation Message, when user click on 'Delete' action if 'Show Confirmation Box' is disable in action config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table Action     | Show Confirmation Box | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Show Confirmation Box | false         | ProgramReviewStepTemplates | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | 4          | Test Description | Test      | 0               | 1           |
    And I pause execution for "4" seconds
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    And I click on "Delete" icon for "4" inside table without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309528 @309530
  Scenario Outline: LWC-E-grid-Child_Config Delete_Admin_To verify confirmation box should popup with, Confirmation Message, when user click on 'Delete' action if 'Show Confirmation Box' is disable in action config
  |LWC-E-grid-Child_Config Delete_PM_To verify confirmation box should popup with, Confirmation Message, when user click on 'Delete' action if 'Show Confirmation Box' is disable in action config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table Action     | Show Confirmation Box | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Show Confirmation Box | false         | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    And I click on "Delete" icon for "Test" inside table without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309591 @309592
  Scenario Outline:LWC-E-grid-Parent_Config Delete_Admin_To verify 'Delete' action Rendering location on table same as mentioned in the config
  |LWC-E-grid-Parent_Config Delete_PM_To verify 'Delete' action Rendering location on table same as mentioned in the config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location  | Row               | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location  | Row           | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | 4          | Test Description | Test      | 0               | 1           |
    And I pause execution for "4" seconds
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly can see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309614 @309615
  Scenario Outline:LWC-E-grid-Parent_Config Delete_Admin_To verify Header Action Display Type Rendering on table same as mentioned in the config
  |LWC-E-grid-Parent_Config Delete_PM_To verify Header Action Display Type Rendering on table same as mentioned in the config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button        | ProgramReviewStepTemplates | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    Then I softly can see row level action button "Delete" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309606 @309607
  Scenario Outline: LWC-E-grid-Parent_Config Delete_Admin_To verify when user deleted the record table should be refreshed.
  |LWC-E-grid-Parent_Config Delete_PM_To verify when user deleted the record table should be refreshed.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description | Step Name      | Step Weight (%) |
      | 4          | Test        | Review Testing | 0               |
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    When I click on "Delete" icon for "4" inside table
    And I see the following message in the page details :
      | Record deleted successfully. |
    Then I see table is refreshing

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309609 @309610
  Scenario Outline: LWC-E-grid-Child_Config Delete_Admin_To verify when user deleted the record table should be refreshed.
  |LWC-E-grid-Child_Config Delete_PM_To verify when user deleted the record table should be refreshed.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    When I click on "Delete" icon for "Test" inside table
    And I see the following message in the page details :
      | Record deleted successfully. |
    Then I see table is refreshing

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309619 @309621
  Scenario Outline: LWC-E-grid-Child_Config Delete_Admin_To verify Header Action Display Type Rendering on table same as mentioned in the config
  |LWC-E-grid-Child_Config Delete_PM_To verify Header Action Display Type Rendering on table same as mentioned in the config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId         |
      | Flex Table Action     | Header Action Display Type | Button            | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Header Action Display Type | Button        | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly can see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309625 @309626
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify when user click on 'Delete' action and  and click on 'OK' on the confirmation box then record gets deleted and getting the confirmation message as 'Record deleted Successfully'
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify when user click on 'Delete' action and  and click on 'OK' on the confirmation box then record gets deleted and getting the confirmation message as 'Record deleted Successfully'|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description | Step Name      | Step Weight (%) |
      | 4          | Test        | Review Testing | 0               |
    When I perform quick search for "4" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    And I click on "Delete" icon for "Test" inside table without accept popup
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    And I see the following message in the page details :
      | Record deleted successfully. |

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309628 @309629 @309454 @309464
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify when user click on 'Delete' action and  and click on 'OK' on the confirmation box then record gets deleted and getting the confirmation message as 'Record deleted Successfully'
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify when user click on 'Delete' action and  and click on 'OK' on the confirmation box then record gets deleted and getting the confirmation message as 'Record deleted Successfully'|
  |LWC-E-grid-Child_UI/UX Delete_Admin_To verify count of 'Total Records' on child table when user deleted the records.|
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify count of 'Total Records' on child table when user deleted the records.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    And I pause execution for "3" seconds
    Then I see Total Records count "Total Records: 2" in table name "---flexgrid:-:ProgramReviewStepChildTableId---"
    When I perform quick search for "50" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    And I click on "Delete" icon for "Test" inside table without accept popup
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    And I see the following message in the page details :
      | Record deleted successfully. |
    #309454 #309464
    Then I see Total Records count "Total Records: 1" in table name "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310109 @310118
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_PM_To verify when user hover on Delete action then Action Name should be display same as mentioned in config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Flex Table Action     | Action Name | Delete            | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action Name | Delete1       | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description | Step Name      | Step Weight (%) |
      | 4          | Test        | Review Testing | 0               |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly can see row level action button "Delete1" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310121 @310131
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify when user hover on Delete action then Action Name should be display same as mentioned in config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | filterId         |
      | Flex Table Action     | Action Name | Delete            | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action Name | Delete1       | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly can see row level action button "Delete1" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310136 @310141
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Users in config
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify hide Delete action as per hide expression for Users in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionUserTypeInternal | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I perform quick search for "Pre-Screen Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310144 @310145
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Users in config
  |LWC-E-grid-Child_UI/UX De  lete_PM_To verify hide Delete action as per hide expression for Users in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionUserTypeInternal | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310138 @310147
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Apps in config
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify hide Delete action as per hide expression for Apps in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionUserAppStateAsGrantor | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    When I perform quick search for "Pre-Screen Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310149 @310151
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Apps in config
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify hide Delete action as per hide expression for Apps in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionUserAppStateAsGrantor | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310140 @310164
  Scenario Outline: LWC-E-grid-Parent_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Context in config
  |LWC-E-grid-Parent_UI/UX Delete_PM_To verify hide Delete action as per hide expression for Context in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionContextView | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I perform quick search for "Pre-Screen Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @310166 @310167
  Scenario Outline: LWC-E-grid-Child_UI/UX Delete_Admin_To verify hide Delete action as per hide expression for Context in config
  |LWC-E-grid-Child_UI/UX Delete_PM_To verify hide Delete action as per hide expression for Context in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ExpressionForDeleteActionContextView | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @352210 @352211
  Scenario Outline:LWC-E-grid-Delete action_Admin_To verify that action displayed at each row/record of the table, on selecting Location - Row
  |LWC-E-grid-Delete action_PM_To verify that action displayed at each row/record of the table, on selecting Location - Row
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location  | Row               | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField                        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location  | Row           | {flexgrid:ProgramReviewStepParentTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I perform quick search for "Pre-Screen Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly can see row level action button "Delete" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I perform quick search for "SME Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly can see row level action button "Delete" against "SME Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I perform quick search for "Management Review" in "---flexgrid:-:ProgramReviewStepParentTableId---" panel
    Then I softly can see row level action button "Delete" against "Management Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309595 @309597
  Scenario Outline: LWC-E-grid-Child_Config Delete_Admin_To verify 'Delete' action Rendering location on table same as mentioned in the config
  |LWC-E-grid-Child_Config Delete_PM_To verify 'Delete' action Rendering location on table same as mentioned in the config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Flex Table Action     | Location  | Row               | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField                       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location  | Row           | {flexgrid:ProgramReviewStepChildTableId} | Name                      | Delete                     |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test      | 50              | 1                                         | Checked   | No                     |
    When I perform quick search for "Test" in "---flexgrid:-:ProgramReviewStepChildTableId---" panel
    Then I softly can see row level action button "Delete" against "Test" in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"

    Examples:
      | User |
     # | ADMIN |
      | PM   |

  @309415 @309516 @309468 @309630 @309622 @309611 @309598
  Scenario:LWC-E-grid-Child_Config Delete_SPI_To verify pop up the confirmation box when user click on 'Delete' action if 'Show Confirmation Box' is enable in action config
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify that when user click on 'OK' button on confirmation box then record should get deleted successfully|
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify when user click on 'Delete' action and  and click on 'OK' on the confirmation box then record gets deleted and getting the confirmation message as 'Record deleted Successfully'|
  |LWC-E-grid-Child_UI/UX Delete_SPI_To verify count of 'Total Records' on child table when user deleted the records.|
  |LWC-E-grid-Child_Config Delete_SPI_To verify Header Action Display Type Rendering on table same as mentioned in the config|
  |LWC-E-grid-Child_Config Delete_SPI_To verify when user deleted the record table should be refreshed.|
  |LWC-E-grid-Child_Config Delete_SPI_To verify 'Delete' action Rendering location on table same as mentioned in the config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Show Confirmation Box      | true                                                             | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message       | Once it is deleted it cannot be restored. Do you want to delete? | ApiGeneratedId:1 |
      | Flex Table Action     | Header Action Display Type | Button                                                           | ApiGeneratedId:3 |
      | Flex Table Action     | Location                   | Row                                                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Show Confirmation Box      | true          | TestAutomationFlexTable5 | Name                      | Delete                     |
      | Flex Table Action     | Confirmation Message       | Automation    | TestAutomationFlexTable5 | Name                      | Delete                     |
      | Flex Table Action     | Header Action Display Type | Button        | TestAutomationFlexTable5 | Name                      | Delete                     |
      | Flex Table Action     | Location                   | Row           | TestAutomationFlexTable5 | Name                      | Delete                     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I pause execution for "4" seconds
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    When I enter the following values into flex table with id "---flexgrid:-:TestChildTableId---" by clicking "New" :
      | Eligibility Question Name | Picklist 2 |
      | Delete Que                | Step 4     |
    And I see the following message in the page details :
      | Saved Successfully! |
    Then I see Total Records count "Total Records: " in table name "---flexgrid:-:TestChildTableId---"
    When I perform quick search for "Delete Que" in "---flexgrid:-:TestChildTableId---" panel
    #309622 #309598
    Then I softly can see row level action button "Delete" against "Delete Que" in flex table with id "---flexgrid:-:TestChildTableId---"
    And I click on "Delete" icon for "Delete Que" inside table without accept popup
    #309516
    Then I softly see confirmation box with body "Automation" is displayed
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    #309415 #309630
    Then I see the following message in the page details :
      | Record deleted successfully. |
    #309611
    Then I see table is refreshing
    #309468
    Then I see Total Records count "Total Records: " in table name "---flexgrid:-:TestChildTableId---"


