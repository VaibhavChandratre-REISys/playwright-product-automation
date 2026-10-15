@newlyAddedUserStories @RecentUS @DaillyUserStoryUpdate

Feature: Temparary file for PRs
Business Need: In

  @FW-24571 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-PM-To verify that Page Block Separator should visible on Page Block as per sort order.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue    | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Information" sub tab
    Then I see page block separator with title "Page block separator" is displayed

  @FW-24577 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-PM-To verify that configured Field Label Override value is displayed as the page block separator label.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator Field Label Override | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator Field Label Override | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Information" sub tab
    Then I see page block separator with title "Page block separator Field Label Override" is displayed

  @FW-24578 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-PM-To verify that configured Help Text Long text value is displayed for the page block separator after Hover on icon.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator                | ServiceAreaGrantor | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceAreaGrantor | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator                | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Information" sub tab
    When I hover mouse on help text icon page block separator title "Page block separator"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24579 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-PM-To verify that Page block separator should support in PDF
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator                | ServiceAreaGrantor | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceAreaGrantor | ApiGeneratedId:2 |
      | Page Block                               | Is Active            | false                               | ServiceAreaGrantor | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator                | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator4} |
      | Page Block:Page Block Detail             | Is Active            | false                               | ServiceAreaGrantor | Name                      | {SavedValue:gridpageblockforpmuser}   |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Information" sub tab
    When I click on "Download as PDF" in the page details
    Then I see "Page block separator" on page "1" of "govgrants" pdf file

  @FW-24581 @FW-24582 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-PM-To verify that 3 Page block separator should in Page Block.
  |LWC-Layout-Page Block Separator-PM-To verify that deleting a page block separator removes it from the form layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceAreaGrantor | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | ServiceAreaGrantor | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | ServiceAreaGrantor | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator3} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed
    Then I softly do not see page block separator with title "Page block separator 3" is displayed

  @FW-24585 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-PM-To verify that Page Block Separator should visible on Page Block as per sort order.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceArea Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                    | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator12345 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I wait for "3" seconds
    Then I softly see page block separator with title "Pageblockseparator12345" is displayed

  @FW-24593 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-PM-To verify that configured Field Label Override value is displayed as the page block separator label.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceArea Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | ServiceArea Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | ServiceArea Create | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                       | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator@#$%^&!1 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                       | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator@#$%^&!2 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                       | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator@#$%^&!3 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I wait for "3" seconds
    Then I softly see page block separator with title "Pageblockseparator@#$%^&!1" is displayed
    Then I softly see page block separator with title "Pageblockseparator@#$%^&!2" is displayed
    Then I softly see page block separator with title "Pageblockseparator@#$%^&!3" is displayed

  @FW-24594 @US-FW-24570
  Scenario:LWC-Modal-Page Block Separator-PM-To verify that configured Help Text Long value is displayed for the page block separator after Hover on icon.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | ServiceArea Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceArea Create | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | ServiceAreaGrantor | Name                      | {SavedValue:modalPageblockseparator1} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I wait for "3" seconds
    Then I softly see page block separator with title "Pageblockseparator12345" is displayed
    When I hover mouse on help text icon page block separator title "Page block separator 1"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24596 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-PM-To verify that configured multiple Page Block Separator (3) should display in Page Block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceArea Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | ServiceArea Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | ServiceArea Create | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 1 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 2 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 3 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I wait for "3" seconds
    Then I softly see page block separator with title "Pageblockseparator 1" is displayed
    Then I softly see page block separator with title "Pageblockseparator 2" is displayed
    Then I softly see page block separator with title "Pageblockseparator 3" is displayed

  @FW-24597 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-PM-To verify that deleting a page block separator removes it from the form Modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | ServiceArea Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | ServiceArea Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | ServiceArea Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | ServiceArea Create | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 1 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 2 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Pageblockseparator 3 | ServiceArea Create | Name                      | {SavedValue:modalPageblockseparator3} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I wait for "3" seconds
    Then I softly do not see page block separator with title "Pageblockseparator 1" is displayed
    Then I softly do not see page block separator with title "Pageblockseparator 2" is displayed
    Then I softly do not see page block separator with title "Pageblockseparator 3" is displayed

  @FW-24608 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-SPI-To verify that Page Block Separator should visible on Page Block as per sort order.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField               | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:2 |
      | Page Block                               | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block:Page Block Detail             | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:gridpageblockforSPIuser}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "3" seconds
    Then I see page block separator with title "Page block separator 1" is displayed

  @FW-24612 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-SPI-To verify that configured Help Text Long value is displayed for the page block separator after Hover on icon.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField               | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:2 |
      | Page Block                               | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block:Page Block Detail             | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:gridpageblockforSPIuser}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "5" seconds
    And I get current URL
    When I hover mouse on help text icon page block separator title "Page block separator 1"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24613 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-SPI-To verify that Page block separator should support in PDF
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField               | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:2 |
      | Page Block                               | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block:Page Block Detail             | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:gridpageblockforSPIuser}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Download as PDF" in the page details
    Then I see "Page block separator 1" on page "1" of "govgrants" pdf file

  @FW-24614 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-SPI-To verify that adding multiple Page Block Separator can be added in Layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField               | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Annoucement External Profile-FOA | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3              | Annoucement External Profile-FOA | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:8 |
      | Page Block                               | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block:Page Block Detail             | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:gridpageblockforSPIuser}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "3" seconds
    Then I see page block separator with title "Page block separator 1" is displayed
    Then I see page block separator with title "Page block separator 2" is displayed
    Then I see page block separator with title "Page block separator 3" is displayed

  @FW-24615 @US-FW-24570
  Scenario: LWC-Layout-Page Block Separator-SPI-To verify that deleting a page block separator removes it from the form layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField               | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Annoucement External Profile-FOA | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3              | Annoucement External Profile-FOA | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | ApiGeneratedId:8 |
      | Page Block                               | Is Active            | false                               | Annoucement External Profile-FOA | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3              | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Annoucement External Profile-FOA | Name                      | {SavedValue:spilayoutPageblockseparator3} |
      | Page Block:Page Block Detail             | Is Active            | false                               | Annoucement External Profile-FOA | Name                      | {SavedValue:gridpageblockforSPIuser}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed
    Then I softly do not see page block separator with title "Page block separator 3" is displayed


  @FW-24621 @FW-24624 @US-FW-24570
  Scenario:LWC-Modal-Page Block Separator-SPI-To verify that Page Block Separator can be configured on Page Block in Modal.
  |LWC-Modal-Page Block Separator-SPI-To verify that configured Field Label Override value is displayed as the page block separator label.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
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
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed

  @FW-24625 @US-FW-24570
  Scenario:LWC-Modal-Page Block Separator-SPI-To verify that configured Help Text Long value is displayed for the page block separator after Hover on icon.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2              | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
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
    When I hover mouse on help text icon page block separator title "Page block separator 1"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24626 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-SPI-To verify that Page block separator should visible blank.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
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
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed

  @FW-24627 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-SPI-To verify that adding multiple Page Block Separator can be added in Modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
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
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed

  @FW-24628 @US-FW-24570
  Scenario: LWC-Modal-Page Block Separator-SPI-To verify that deleting a page block separator removes it from the form Modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Grantor Application Create | Name                      | {SavedValue:spiModalblockseparator2} |
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
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed

  @FW-24629 @FW-24632 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-SPI-To verify that Page Block Separator can be configured on Page Block in Forms.
  |LWC-Forms-Page Block Separator-SPI-To verify that configured Field Label Override value is displayed as the page block separator label.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
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
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed

  @FW-24633 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-SPI-To verify that configured Help Text Long value is displayed for the page block separator after Hover on icon.
  |LWC-Forms-Page Block Separator-SPI-To verify that configured Field Label Override value is displayed as the page block separator label.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
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
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I hover mouse on help text icon page block separator title "Page block separator 1"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24634 @US-FW-24570
  Scenario:LWC-Forms-Page Block Separator-SPI-To verify that Page block separator should support in PDF
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                   | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                               | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1              | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long Page block separator | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
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
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Download as PDF" in the page details
    Then I see "Page block separator 1" on page "1" of "govgrants" pdf file

  @FW-24635 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-SPI-To verify that adding multiple Page Block Separator can be added in Forms.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
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
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed

  @FW-24636 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-SPI-To verify that deleting a page block separator removes it from the form Forms.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
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
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed

  @FW-24637 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-SPI – Verify that the Page Block Separator is displayed in the configured Sort Order with the configured Field Label Override, displays the Help Text Long on hover and is supported in PDF.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                                                                                                                                                                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                                                                                                                                                | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                                                                                                                                                | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2                                                                                                                                                                                                                              | Standard Assurances Form | Name                      | {SavedValue:spiFormsblockseparator2} |
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
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Download as PDF" in the page details
    Then I see "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London" on page "1" of "govgrants" pdf file

  @FW-24599 @FW-24602 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM-To verify that Page Block Separator should visible on Page Block as per sort order.
  |LWC-Forms-Page Block Separator-PM-To verify that configured Field Label Override value is displayed as the page block separator label.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed

  @FW-24603 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM-To verify that configured Help Text Long value is displayed for the page block separator after Hover on icon.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I hover mouse on help text icon page block separator title "Page block separator 1"
    Then I softly see "Help Text Long Page block separator" shown as help text

  @FW-24604 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM-To verify that Page block separator should support in PDF
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I click on "Download as PDF" in the page details
    Then I see "Page block separator 1" on page "1" of "govgrants" pdf file

  @FW-24605 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM-To verify that configured multiple Page Block Separator (3) should display in Page Block on Forms.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                   | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see page block separator with title "Page block separator 1" is displayed
    Then I softly see page block separator with title "Page block separator 2" is displayed
    Then I softly see page block separator with title "Page block separator 3" is displayed

  @FW-24606 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM-To verify that deleting a page block separator removes it from the Forms.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly do not see page block separator with title "Page block separator 1" is displayed
    Then I softly do not see page block separator with title "Page block separator 2" is displayed
    Then I softly do not see page block separator with title "Page block separator 3" is displayed

  @FW-24607 @US-FW-24570
  Scenario: LWC-Forms-Page Block Separator-PM – Verify that the Page Block Separator is displayed in the configured Sort Order with the configured Field Label Override, displays the Help Text Long on hover and is supported in PDF.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue      | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 1 | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2 | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                  | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3 | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                                                                                                                                                                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                                                                                                                                                                                                                                               | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator1} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                                                                                                                                                                                                                                               | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 2                                                                                                                                                                                                                              | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator2} |
      | Page Block Config:Page Block Rule Detail | Is Active            | false                                                                                                                                                                                                                                               | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Page block separator 3                                                                                                                                                                                                                              | General Review Form | Name                      | {SavedValue:EXEFormsblockseparator3} |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    When I hover mouse on help text icon page block separator title "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London"
    Then I softly see "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London" shown as help text
    When I click on "Download as PDF" in the page details
    Then I see "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since 1966 when designers at Letrasset and James Mosley the librarian at St Bride Printing Library in London" on page "1" of "govgrants" pdf file

  @FW-24617 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the modal refreshes automatically without closing when a dependent field value changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |

  @FW-24618
  Scenario:LWC - Modal - SPI - To Verify that the modal refreshes automatically without closing when a dependent field value changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue              | filterId         |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:DefaultConfig | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - My Records"
    And I click on "View" action for first record of table
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I wait for "2" seconds

  @FW-24619 @US-FW-24616
  Scenario:LWC - Modal - PM - Verify that after the modal refreshes, all dependent data, actions, calculations, and displayed information are updated based on the latest field values, and that the modal remains open throughout the refresh process.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |

  @FW-24639 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that after the modal refresh depend on changing dependendt field value user able to hide table top level action.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see top right button "Add" in flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"


  @FW-24656 @US-FW-24616
  Scenario:LWC - Modal - PM - To Verify the modal refresh occurs without noticeable flickering, blinking, or UI glitches.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see fields "Number__c" is in edit mode

  @FW-24660 @US-FW-24616
  Scenario:LWC - Modal - PM - To Verify that after the modal refreshes due to a change in a dependent field value, the user is able to hide the layout-level action in the modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    Then I cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24661 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level Text type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Test Button" in page detail
    Then I softly can see top right button "Delete" in page detail
    Then I softly can see top right button "Update Role" in page detail
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Update Role" in page detail

  @FW-24658 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that after the modal refresh depend on changing dependent field value user able to hide table row level action.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c    | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    And I wait for "3" seconds
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly cannot see top right button "Update Role" in page detail

  @FW-24664 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level Text type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c | SoleSourceAwardRecipients |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                  | SoleSourceAwardRecipients | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "Number__c" is in edit mode

  @FW-24665 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level Email/Phone/URL type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names  | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON     |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON     |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON     |                                  | ApiGeneratedId:3 |
      | Flex Table Action     | Hide Expression JSON |                                  | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | Id,Code__c,Name,ApplicantType__c,EmailAddress__c,Phone,Website | SoleSourceAwardRecipients |                           |                                          |
      | Flex Table List       | Hide Column JSON     | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSEmailAddress__c} |
      | Flex Table List       | Hide Column JSON     | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}           |
      | Flex Table List       | Hide Column JSON     | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSWebsite}         |
      | Flex Table Action     | Hide Expression JSON |                                                                | SoleSourceAwardRecipients | Name                      | Edit                                     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly see "Email Address" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly see "Account Phone" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly see "Website" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24666 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level Email/Phone/URL type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:6 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,EmailAddress__c,Phone,Website | SoleSourceAwardRecipients |                           |                                          |
      | Flex Table List       | Hide Column JSON      |                                                                | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSEmailAddress__c} |
      | Flex Table List       | Hide Column JSON      |                                                                | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}           |
      | Flex Table List       | Hide Column JSON      |                                                                | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSWebsite}         |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSEmailAddress__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}           |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSWebsite}         |
      | Flex Table Action     | Hide Expression JSON  |                                                                | SoleSourceAwardRecipients | Name                      | Edit                                     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "EmailAddress__c" is in edit mode
    Then I softly do not see fields "Phone" is in edit mode
    Then I softly do not see fields "Website" is in edit mode

  @FW-24667 @US-FW-24616
  Scenario:LWC - Modal - PM - To Verify that the table-level numeric type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,UserLimit__c,Currency__c,OverallScore__c | SoleSourceAwardRecipients |                           |                                          |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSUserLimit__c}    |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSCurrency__c}     |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSOverallScore__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "X_UserLimit" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see "Currency" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see "Overall Score" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24668 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level Numeric type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:6 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,UserLimit__c,Currency__c,OverallScore__c | SoleSourceAwardRecipients |                           |                                          |
      | Flex Table List       | Hide Column JSON      |                                                                           | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSEmailAddress__c} |
      | Flex Table List       | Hide Column JSON      |                                                                           | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}           |
      | Flex Table List       | Hide Column JSON      |                                                                           | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSWebsite}         |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSEmailAddress__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}           |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSWebsite}         |
      | Flex Table Action     | Hide Expression JSON  |                                                                           | SoleSourceAwardRecipients | Name                      | Edit                                     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "UserLimit__c" is in edit mode
    Then I softly do not see fields "Currency__c" is in edit mode
    Then I softly do not see fields "OverallScore__c" is in edit mode

  @FW-24669 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level date & time type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,DUNSExpirationDate__c,DateAndTime__c | SoleSourceAwardRecipients |                           |                                                |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDUNSExpirationDate__c} |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDateAndTime__c}        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "DUNS/SAMS Expiration Date" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see "DateAndTime" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24670 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level date & time type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:4 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,DUNSExpirationDate__c,DateAndTime__c | SoleSourceAwardRecipients |                           |                                                |
      | Flex Table List       | Hide Column JSON      |                                                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDUNSExpirationDate__c} |
      | Flex Table List       | Hide Column JSON      |                                                                       | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDateAndTime__c}        |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDUNSExpirationDate__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSDateAndTime__c}        |
      | Flex Table Action     | Hide Expression JSON  |                                                                       | SoleSourceAwardRecipients | Name                      | Edit                                           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "DUNSExpirationDate__c" is in edit mode
    Then I softly do not see fields "DateAndTime__c" is in edit mode

  @FW-24671 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level boolean type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,CFDA__c | SoleSourceAwardRecipients |                           |                                  |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}      | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSCFDA__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "X_CFDA" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24672 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level boolean type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:2 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,CFDA__c | SoleSourceAwardRecipients |                           |                                  |
      | Flex Table List       | Hide Column JSON      |                                          | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSCFDA__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}      | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSCFDA__c} |
      | Flex Table Action     | Hide Expression JSON  |                                          | SoleSourceAwardRecipients | Name                      | Edit                             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "CFDA__c" is in edit mode

  @FW-24673 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level picklist/multi picklist type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,Region__c,MultiSelectPickList__c | SoleSourceAwardRecipients |                           |                                                 |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                               | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSRegion__c}              |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                               | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSMultiSelectPickList__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "X_Region" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see "MultiSelectPickList" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24674 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level picklist/multi picklist type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:4 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,Region__c,MultiSelectPickList__c | SoleSourceAwardRecipients |                           |                                                 |
      | Flex Table List       | Hide Column JSON      |                                                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSRegion__c}              |
      | Flex Table List       | Hide Column JSON      |                                                                   | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSMultiSelectPickList__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                               | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSRegion__c}              |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                               | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSMultiSelectPickList__c} |
      | Flex Table Action     | Hide Expression JSON  |                                                                   | SoleSourceAwardRecipients | Name                      | Edit                                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "DUNSExpirationDate__c" is in edit mode
    Then I softly do not see fields "DateAndTime__c" is in edit mode

  @FW-24675 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that the table-level lookup type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,Region__c,PointofContactUser__c | SoleSourceAwardRecipients |                           |                                                |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                              | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPointofContactUser__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "Key Primary Applicant" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24676 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level lookup type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:2 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,Region__c,PointofContactUser__c | SoleSourceAwardRecipients |                           |                                                |
      | Flex Table List       | Hide Column JSON      |                                                                  | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPointofContactUser__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                              | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPointofContactUser__c} |
      | Flex Table Action     | Hide Expression JSON  |                                                                  | SoleSourceAwardRecipients | Name                      | Edit                                           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "PointofContactUser__c" is in edit mode

  @FW-24677 @US-FW-24616
  Scenario:LWC - Modal - PM - To Verify that the table-level standard/formula type column is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                  | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | Id,Code__c,Name,ApplicantType__c,Phone,OrganizationName__c | SoleSourceAwardRecipients |                           |                                              |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                        | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}               |
      | Flex Table List       | Hide Column JSON    | {govgrants_config:NYSEDPATCHUSJson}                        | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSOrganizationName__c} |
    When I login to "As a Grantor" app as "admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "1234" into field "Number__c"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see "Phone" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see "Organization Name" in flex table header "---program:-:SoleSourceAwardRecipientsTableId---"

  @FW-24678 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the table-level standard/formula type column should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names   | Id,Code__c,Name,ApplicantType__c | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON      |                                  | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column JSON |                                  | ApiGeneratedId:4 |
      | Flex Table Action     | Hide Expression JSON  |                                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names   | Id,Code__c,Name,ApplicantType__c,Phone,OrganizationName__c | SoleSourceAwardRecipients |                           |                                              |
      | Flex Table List       | Hide Column JSON      |                                                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}               |
      | Flex Table List       | Hide Column JSON      |                                                            | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSOrganizationName__c} |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                        | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSPhone}               |
      | Flex Table List       | Read Only Column JSON | {govgrants_config:NYSEDPATCHUSJson}                        | SoleSourceAwardRecipients | Name                      | {SavedValue:NYSEDPATCHUSOrganizationName__c} |
      | Flex Table Action     | Hide Expression JSON  |                                                            | SoleSourceAwardRecipients | Name                      | Edit                                         |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    When I perform quick search for "Test Automation Organization" in "---program:-:SoleSourceAwardRecipientsTableId---" panel
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:SoleSourceAwardRecipientsTableId---"
    Then I softly do not see fields "Phone" is in edit mode
    Then I softly do not see fields "OrganizationName__c" is in edit mode

  @FW-24679 @US-FW-24616
  Scenario:LWC - Modal - PM - To Verify that the modal layout level field type STD/TEXT/Percent/Phone/Picklist/Number/URL is hidden when the dependent field value is changed to Secondary.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor Contact    | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor Contact    | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor Contact    | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor Contact    | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor Contact    | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor Contact    | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor Contact    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSPhonePBD}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSOverAllRisk__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSURL__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSPhonePBD}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSOverAllRisk__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSURL__c}         |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I cannot see field "Phone" inside page block
    Then I cannot see field "OverAllRisk" inside page block
    Then I cannot see field "Number" inside page block
    Then I cannot see field "URL" inside page block

  @FW-24680 @US-FW-24616
  Scenario: LWC - Modal - PM - To Verify that When the dependent field value is changed to Secondary, then the modal layout level field type STD/TEXT/Percent/Phone/Picklist/Number/URL should be displayed in read-only mode.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor Contact    | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor Contact    | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor Contact    | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor Contact    | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor Contact    | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor Contact    | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor Contact    | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor Contact    | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor Contact    | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor Contact    | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor Contact    | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor Contact    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSPhonePBD}       |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSOverAllRisk__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSURL__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                     | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSPhonePBD}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                     | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSOverAllRisk__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                     | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                     | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSURL__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSPhonePBD}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSOverAllRisk__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSNumber__c}      |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | {govgrants_config:NYSEDPATCHUSJson} | Grantor Contact    | Name                      | {SavedValue:NYSEDPATCHUSURL__c}         |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "NYSED Patch US" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I see "DataTableEnhanceProgramContacts" opens in overLay window
    And I enter "NysedPatchUS" values from "Program_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click modal button "Update Role"
    Then I softly see the following messages in the page details contains:
      | Contact updated to Secondary Role. |
    Then I softly do not see fields "Phone" is in edit mode
    Then I softly do not see fields "OverAllRisk__c" is in edit mode
    Then I softly do not see fields "Number__c" is in edit mode
    Then I softly do not see fields "URL__c" is in edit mode


  @US-FW-24183 @FW-24184 @FW-24186 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario Outline:TC - Server Side Search 10k+ - Admin - To verify that user should be able to see only 10000 records in table at initial state when total records are more than 10k.
  |TC - Server Side Search 10k+ - PM - To verify that user should be able to see only 10000 records in table at initial state when total records are more than 10k.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     | Program__c ='{!programid}'   | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I see Total Records count "Total Records: 10000" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5 of 10000 records" inside table id "---program:-:contactsTableId---"
    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24189 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: TC - Server Side Search 10k+ - PM - To verify that user should be able to search records from database as well even which is not displaying in the table if more than 10k records
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     |                              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | ASC                          | ApiGeneratedId:3 |
      | Flex Table            | Order By            | Contact__r.Organization__c   | ApiGeneratedId:4 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Sort Direction      | ASC                          | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Order By            | Contact__r.Organization__c   | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Sort Order          | -1                           | Grantor State Program           | Name                      | PB-11436                   |
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I perform quick search for "Automation IND" in "---program:-:programsTableId---" panel
    Then I softly see value "Automation IND" for title "Name" inside table "---program:-:programsTableId---"

  @FW-24653 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: Master TC - Server Side Search 10k+ - Admin/PM/SPI - To verify that user should be able to apply advance filter on searched results
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     |                              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | ASC                          | ApiGeneratedId:3 |
      | Flex Table            | Order By            | Contact__r.Organization__c   | ApiGeneratedId:4 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Sort Direction      | ASC                          | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Order By            | Contact__r.Organization__c   | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Sort Order          | -1                           | Grantor State Program           | Name                      | PB-11436                   |
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I perform quick search for "Test Automation Organization" in "---program:-:programsTableId---" panel
    Then I softly see value "Test Automation Organization" for title "Organization" inside table "---program:-:programsTableId---"
    And I click on advance filter of table id "---program:-:contactsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:contactsTableId---" for LWC
      | Organization | contains | Test Automation Organization |
    Then I softly see value "Test Automation Organization" for title "Organization" inside table "---program:-:programsTableId---"

  @FW-24652 @FW-24652_1 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: Master TC - Server Side Search 10k+ - Admin/PM/SPI - To verify that user should be able to search for all datatype fields in table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     |                              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | ASC                          | ApiGeneratedId:3 |
      | Flex Table            | Order By            | Contact__r.Organization__c   | ApiGeneratedId:4 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFNMultipleDataType} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Filter Criteria     |                                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Default Page Size   | 5                                            | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Sort Direction      | ASC                                          | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Order By            | Contact__r.Organization__c                   | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Sort Order          | -1                                           | Grantor State Program           | Name                      | PB-11436                   |
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I perform quick search for "Project Director/Manager" in "---program:-:contactsTableId---" panel
    Then I softly see value "Project Director/Manager" for title "Project Role" inside table "---program:-:contactsTableId---"
    And I perform quick search for "Automation SPI3" in "---program:-:contactsTableId---" panel
    Then I softly see value "Automation SPI3" for title "Name" inside table "---program:-:contactsTableId---"
    And I perform quick search for "automationspi31@yopmail.com" in "---program:-:contactsTableId---" panel
    Then I softly see value "automationspi31@yopmail.com" for title "Email" inside table "---program:-:contactsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---program:-:contactsTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---program:-:contactsTableId---"
    And I perform quick search for "$0.00" in "---program:-:contactsTableId---" panel
    Then I softly see value "$0.00" for title "BaseSalary" inside table "---program:-:contactsTableId---"
    And I perform quick search for "True" in "---program:-:contactsTableId---" panel
    Then I softly see value "True" for title "Is Key Contact" inside table "---program:-:contactsTableId---"
    And I perform quick search for "www.google.com" in "---program:-:contactsTableId---" panel
    Then I softly see value "www.google.com" for title "URL" inside table "---program:-:contactsTableId---"
    And I perform quick search for "9527371482" in "---program:-:contactsTableId---" panel
    Then I softly see value "9527371482" for title "Phone Number" inside table "---program:-:contactsTableId---"

  @FW-24652 @FW-24652_2 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: Master TC - Server Side Search 10k+ - Admin/PM/SPI - To verify that user should be able to search for all datatype fields in table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     |                              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | ASC                          | ApiGeneratedId:3 |
      | Flex Table            | Order By            | Contact__r.Organization__c   | ApiGeneratedId:4 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | {SavedValue:ContactTableDFNMultipleDataType} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Filter Criteria     |                                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Default Page Size   | 5                                            | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Sort Direction      | ASC                                          | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General           | Order By            | Contact__r.Organization__c                   | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Sort Order          | -1                                           | Grantor State Program           | Name                      | PB-11436                   |
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I perform quick search for "Project Director/Manager" in "---program:-:contactsTableId---" panel
    Then I softly see value "05/05/2025" for title "Date" inside table "---program:-:contactsTableId---"
    And I perform quick search for "05/05/2025" in "---program:-:contactsTableId---" panel
    Then I softly see value "05/05/2025" for title "Name" inside table "---program:-:contactsTableId---"
    And I perform quick search for "05/05/2025" in "---program:-:contactsTableId---" panel
    Then I softly see value "05/05/2025" for title "Date And Time" inside table "---program:-:contactsTableId---"

  @FW-24650 @FW-24649 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario Outline: TC - Server Side Search 10k+ - PM - To verify that after more than 10k records loaded in table Quick search should not be visible
  |TC - Server Side Search 10k+ - Admin - To verify that after more than 10k records loaded in table Quick search should not be visible
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     | Program__c ='{!programid}'   | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I see Total Records count "Total Records: 10000" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5 of 10000 records" inside table id "---program:-:contactsTableId---"
    And I click on top right button "Load Data" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly do not see Quick Search is displayed in "---program:-:contactsTableId---" table

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24647 @FW-24645 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario Outline: TC - Server Side Search 10k+ - PM - To verify that after page refreshed all records should be display in table
  |TC - Server Side Search 10k+ - Admin - To verify that after page refreshed all records should be display in table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     | Program__c ='{!programid}'   | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I see Total Records count "Total Records: 10000" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5 of 10000 records" inside table id "---program:-:contactsTableId---"
    And I click on top right button "Load Data" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly do not see Quick Search is displayed in "---program:-:contactsTableId---" table
    And I refresh the page
    Then I softly do not see Quick Search is displayed in "---program:-:contactsTableId---" table


    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24643 @FW-24598 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario Outline: TC - Server Side Search 10k+ - PM - To verify that page should be refreshed on clicking the notification under bell icon
  |TC - Server Side Search 10k+ - Admin - To verify that page should be refreshed on clicking the notification under bell icon|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     | Program__c ='{!programid}'   | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I see Total Records count "Total Records: 10000" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5 of 10000 records" inside table id "---program:-:contactsTableId---"
    And I click on top right button "Load Data" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I see entire page is refreshing

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24505 @FW-24504 @FW-24502 @FW-24500 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario Outline: TC - Server Side Search 10k+ - PM - To verify that user should be able to see the notification in bell icon when Data is loaded in table
  |TC - Server Side Search 10k+ - Admin - To verify that user should be able to see the notification in bell icon when Data is loaded in table|
  |TC - Server Side Search 10k+ - PM - To verify that user should be able to see the message on table after clicking the Load Data action|
  |TC - Server Side Search 10k+ - Admin - To verify that user should be able to see the message on table after clicking the Load Data action|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Filter Criteria     | Program__c ='{!programid}'   | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 5                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Filter Criteria     |                              | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Default Page Size   | 5                            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I see Total Records count "Total Records: 10000" in table name "---program:-:contactsTableId---"
    Then I see table contains "Showing 1 to 5 of 10000 records" inside table id "---program:-:contactsTableId---"
    And I click on top right button "Load Data" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly see the following messages in the page details contains:
      | You will receive a notification within a few minutes. Then, refresh the page to view the retrieved records. If you do not receive the notification within the given time, please contact your system administrator. |

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24503 @FW-24506 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: TC - Server Side Search 10k+ - SPI - To verify that user should be able to see the message on table after clicking the Load Data action
  |TC - Server Side Search 10k+ - SPI - To verify that user should be able to see the notification in bell icon when Data is loaded in table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue                              | filterId         |
      | Flex Table            | Filter Criteria | {SavedValue:BudgetPeriodDefaultFilterCriteria} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField                    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Filter Criteria |               | RecipientAwardBudgetCategoryFlexTable |                           |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" action for first record of table
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see Total Records count "Total Records: 10000" in table name "---amendment:-:RecipientAwardBudgetTableId---"
    Then I softly see the following messages in the page details contains:
      | There are over 10,000 records in this table. Click "Load Data" button to Retrieve all of records. Users cannot Add (New), Edit, Delete, or Quick Search to Retrieved records because they are static. |
    And I click on top right button "Load Data" in flex table with id "---amendment:-:RecipientAwardBudgetTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly see the following messages in the page details contains:
      | You will receive a notification within a few minutes. Then, refresh the page to view the retrieved records. If you do not receive the notification within the given time, please contact your system administrator. |

  @FW-24644 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: TC - Server Side Search 10k+ - SPI - To verify that page should be refreshed on clicking the notification under bell icon
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue                              | filterId         |
      | Flex Table            | Filter Criteria | {SavedValue:BudgetPeriodDefaultFilterCriteria} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField                    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Filter Criteria |               | RecipientAwardBudgetCategoryFlexTable |                           |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" action for first record of table
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see Total Records count "Total Records: 10000" in table name "---amendment:-:RecipientAwardBudgetTableId---"
    Then I softly see the following messages in the page details contains:
      | There are over 10,000 records in this table. Click "Load Data" button to Retrieve all of records. Users cannot Add (New), Edit, Delete, or Quick Search to Retrieved records because they are static. |
    And I click on top right button "Load Data" in flex table with id "---amendment:-:RecipientAwardBudgetTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly see the following messages in the page details contains:
      | You will receive a notification within a few minutes. Then, refresh the page to view the retrieved records. If you do not receive the notification within the given time, please contact your system administrator. |

  @FW-24648 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario: TC - Server Side Search 10k+ - SPI - To verify that after page refreshed all records should be display in table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue                              | filterId         |
      | Flex Table            | Filter Criteria | {SavedValue:BudgetPeriodDefaultFilterCriteria} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField                    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Filter Criteria |               | RecipientAwardBudgetCategoryFlexTable |                           |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" action for first record of table
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see Total Records count "Total Records: 10000" in table name "---amendment:-:RecipientAwardBudgetTableId---"
    Then I softly see the following messages in the page details contains:
      | There are over 10,000 records in this table. Click "Load Data" button to Retrieve all of records. Users cannot Add (New), Edit, Delete, or Quick Search to Retrieved records because they are static. |
    And I click on top right button "Load Data" in flex table with id "---amendment:-:RecipientAwardBudgetTableId---"
    Then I see entire page is refreshing

  @FW-24651 @US-FW-24183 @NeedToCheckWhere10kPlusRecordAvailable
  Scenario:TC - Server Side Search 10k+ - SPI - To verify that after more than 10k records loaded in table Quick search should not be visible
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue                              | filterId         |
      | Flex Table            | Filter Criteria | {SavedValue:BudgetPeriodDefaultFilterCriteria} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField                    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Filter Criteria |               | RecipientAwardBudgetCategoryFlexTable |                           |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" action for first record of table
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see Total Records count "Total Records: 10000" in table name "---amendment:-:RecipientAwardBudgetTableId---"
    Then I softly see the following messages in the page details contains:
      | There are over 10,000 records in this table. Click "Load Data" button to Retrieve all of records. Users cannot Add (New), Edit, Delete, or Quick Search to Retrieved records because they are static. |
    And I click on top right button "Load Data" in flex table with id "---amendment:-:RecipientAwardBudgetTableId---"
    And I pause execution for "60" seconds
    And I click on "notifications" button on header
    And I pause execution for "10" seconds
    And I click on notification "Contacts - Data Laoded" in notification list
    Then I softly do not see Quick Search is displayed in "---program:-:contactsTableId---" table

  @FW-29950
  Scenario: LWC - Send Invitation - Layout - PM - To verify that, user should be able to see send invitation action on layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed

  @FW-29952
  Scenario:LWC - Send Invitation - Form - PM - To verify that, user should be able to see send invitation action on layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active | false         | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Is Active | true          | General Review Form | Name                      | Send Invitation            |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "5" seconds
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Send Invitation" button is displayed

  @FW-29995
  Scenario: LWC - Send Invitation - Layout - PM - To verify that, user should be able to see send invitation modal on clicking SIA Layout: PM Action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window

  @FW-29996
  Scenario: LWC - Send Invitation - Layout - PM - To verify that,the modal closes when the Close (X) action is clicked
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I close "Send Invitation" modal by clicking the top right x button
    Then I do not see "Send Invitation" opens in overLay window

  @FW-29997
  Scenario: LWC - Send Invitation - Layout - PM - To verify that modal closes when the Close button is clicked.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    And I click "Close" button in modal
    Then I do not see "Send Invitation" opens in overLay window

  @FW-29998
  Scenario: LWC - Send Invitation - Form - PM - To verify that, user should be able to see send invitation modal on clicking SIFF: PM Action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    And I click "Send" button in modal

  @FW-30026
  Scenario: LWC - Send Invitation - Layout - PM - To verify that support of classic email template for send invitation action on layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window

  @FW-30027
  Scenario: LWC - Send Invitation - Layout - PM - To verify that support of LWC email template for send invitation action on layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    And I click "Send" button in modal
    Then I softly see the following messages in the page details :
      | Email Sent Successfully. |

  @FW-30028
  Scenario: LWC - Send Invitation - Layout - PM - To verify that when user try to add file more than 1.5 MB then getting error message as "File Size Limit is Exceeded, more than one file is not supported."
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal

  @FW-30030
  Scenario: LWC - Send Invitation - Layout - PM - To verify that when a user tries to add an invalid email address in the Cc field, the system displays the error message “Please enter a valid email address” and removes the invalid email address from the field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I enter value "InvalidEmailAddress" into field "{testData:ToField}" on send email modal
    And I click "Send" button in modal
    Then I softly see the following messages in the page details :
      | Please enter a valid email address |

  @FW-30031
  Scenario: LWC - Send Invitation - Layout - PM - To verify that the entered email address is converted into a pill when the user clicks outside the Cc field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                         | filterId         |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Is Active            | true                                                      | ApiGeneratedId:0 |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Tab Config                 |
      | Page Layout Action    | Is Active            | false                                                     | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Is Active            | true                                                      | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Action URL Lightning | govgrants_config:PageLayoutSendInvitationDefaultActionUrl | Grantor State Program | Name                      | Send Invitation            |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    Then I see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    And I pause execution for "15" seconds
    When I enter value "automationdemo@example.com" into field "{testData:ccField}" on send email modal
    Then I softly see email id "automationdemo@example.com" with pill

