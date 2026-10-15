@AprilReleaseUserStory1 @JuneRelease1 @UIUXfunctionality

Feature: Layout - UIUX related changes US are covered in this feature file
Business Need: Layout/Form/Modal - Support to collapse page block icons when the layout loads.
1.@FW-1439 - Layout/Form/Modal - Support to collapse page block icons when the layout loads.

  @FW-1441 @FW-1442 @FW-1443 @FW-1444 @FW-1445 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - PM - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Layout - collapse page block - PM - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
  |TC - LWC - Layout - collapse page block - PM - To verify that, user can manually expand a collapsed page block|
  |TC - LWC - Layout - collapse page block - PM - To verify that, expanded page block can be manually collapsed again|
  |TC - LWC - Layout - collapse page block - PM - To verify that, no UI overlap or alignment issues after collapse|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField   | filterId         |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10478                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1446 @FW-1447 @FW-1449 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - PM - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Layout - collapse page block - PM - To verify that, if “Enable Collapse By Default” config is enabled under Page Block Config then user should expand page block icons when click on expand icon.|
  |TC - LWC - Layout - collapse page block - PM - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField   | filterId         |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:1 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:2 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10478                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10123                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10151                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-12051                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I navigate to "Files" sub tab
    When I navigate to "Overview" sub tab
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Funding Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Funding Accounts" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "System Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    And I refresh the page
    Then I softly see the page block "Funding Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.

  @FW-1450 @US-FW-1439
  Scenario:TC - LWC - Layout - collapse page block - PM - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField   | filterId         |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:1 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:2 |
      | Page Block            | Enable Collapse By Default | false             | GrantorFundingSource | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10478                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10123                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-10151                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | GrantorFundingSource | Name                      | PB-12051                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I click toggle button to select "Internal Funding Sources - Active"
    And I perform quick search for "Automation Permanent Funding Source" in "---fundingsource:-:fundingSourceTableId---" panel
    When I click on "View" icon for "Automation Permanent Funding Source" inside table
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Funding Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Funding Accounts" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "System Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    When I "Expanded" page block contaninig value "Funding Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I click toggle button to select "Internal Funding Sources - Active"
    And I perform quick search for "Automation Permanent Funding Source" in "---fundingsource:-:fundingSourceTableId---" panel
    When I click on "View" icon for "Automation Permanent Funding Source" inside table
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Funding Information" on the layout with the toggle button in the "down" position.

  @FW-1451 @FW-1452 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - SPI - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Layout - collapse page block - SPI - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13257                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13921                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.
    And I refresh the page
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.

  @FW-1453 @FW-1454 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - SPI - To verify that, user can manually expand a collapsed page block
  |TC - LWC - Layout - collapse page block - SPI - To verify that, expanded page block can be manually collapsed again|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13257                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13921                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Opportunity Files"
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "up" position.
    When I "Expanded" page block contaninig value "Notes"
    Then I softly see the page block "Notes" on the layout with the toggle button in the "up" position.

  @FW-1458 @FW-1461 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - SPI - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Layout - collapse page block - SPI - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13257                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13921                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.
    And I navigate to "Overview" tab
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Opportunity Files"
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "up" position.

  @FW-1462 @US-FW-1439
  Scenario: TC - LWC - Layout - collapse page block - SPI - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
      | Page Block            | Enable Collapse By Default | false             | Annoucement External Profile-FOA | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13257                   |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Annoucement External Profile-FOA | Name                      | PB-13921                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Opportunity Files"
    When I "Expanded" page block contaninig value "Notes"
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "up" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "up" position.
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Files" tab
    Then I softly see the page block "Opportunity Files" on the layout with the toggle button in the "down" position.
    Then I softly see the page block "Notes" on the layout with the toggle button in the "down" position.

  @FW-1495 @FW-1496 @US-FW-1439
  Scenario: TC - LWC - Modal - collapse page block - PM - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Modal - collapse page block - PM - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block            | Enable Collapse By Default | false             | StateFundingSourceCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | StateFundingSourceCreate | Name                      | PB-12050                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1497 @FW-1498 @FW-1499
  Scenario:TC - LWC - Modal - collapse page block - PM - To verify that, user can manually expand a collapsed page block
  |TC - LWC - Modal - collapse page block - PM - To verify that, expanded page block can be manually collapsed again|
  |TC - LWC - Modal - collapse page block - PM - To verify that, no UI overlap or alignment issues after collapse|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block            | Enable Collapse By Default | false             | StateFundingSourceCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | StateFundingSourceCreate | Name                      | PB-12050                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1500 @FW-1501 @FW-1503
  Scenario: TC - LWC - Modal - collapse page block - PM - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Modal - collapse page block - PM - To verify that, if “Enable Collapse By Default” config is enabled under Page Block Config then user should expand page block icons when click on expand icon.|
  |TC - LWC - Modal - collapse page block - PM - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block            | Enable Collapse By Default | false             | StateFundingSourceCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | StateFundingSourceCreate | Name                      | PB-12050                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "up" position.
    And I refresh the page
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "up" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Collapse" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1504 @US-FW-1439
  Scenario:TC - LWC - Modal - collapse page block - PM - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block            | Enable Collapse By Default | false             | StateFundingSourceCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | StateFundingSourceCreate | Name                      | PB-12050                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1506 @FW-1507 @FW-1508 @FW-1509 @FW-1510 @US-FW-1439
  Scenario: TC - LWC - Modal - collapse page block - SPI - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Modal - collapse page block - SPI - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
  |TC - LWC - Modal - collapse page block - SPI - To verify that, user can manually expand a collapsed page block|
  |TC - LWC - Modal - collapse page block - SPI - To verify that, expanded page block can be manually collapsed again|
  |TC - LWC - Modal - collapse page block - SPI - To verify that, no UI overlap or alignment issues after collapse|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Create Grantor Preapplication | Name                      | PB-11789                   |
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
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    And I click on "Create Pre-Application" in the page details
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1511 @FW-1512 @US-FW-1439
  Scenario: TC - LWC - Modal - collapse page block - SPI - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Modal - collapse page block - SPI - To verify that, if “Enable Collapse By Default” config is enabled under Page Block Config then user should expand page block icons when click on expand icon.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Create Grantor Preapplication | Name                      | PB-11789                   |
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
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "up" position.
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    And I refresh the page
    And I click on "Create Pre-Application" in the page details
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I "Expanded" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Information"
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1514 @FW-1515 @FW-1592 @US-FW-1439
  Scenario: TC - LWC - Modal - collapse page block - SPI - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page
  |TC - LWC - Modal - collapse page block - SPI - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login|
  |TC - LWC - Modal - collapse page block - SPI - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Create Grantor Preapplication | Name                      | PB-11789                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I get the "EGMS ID"
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "up" position.
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.
    When I close "Create Pre-Application" modal by clicking the top right x button
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I click on "Create Pre-Application" in the page details
    Then I softly do not see the page block "Information" on the layout with the toggle button in the "up" position.
    Then I softly see the page block "Information" on the layout with the toggle button in the "down" position.

  @FW-1468 @FW-1469 @FW-1470 @FW-1471 @FW-1472 @FW-1474 @US-FW-1439
  Scenario: TC - LWC - Forms- collapse page block - PM - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Forms - collapse page block - PM - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
  |TC - LWC - Forms - collapse page block - PM - To verify that, user can manually expand a collapsed page block|
  |TC - LWC - Forms - collapse page block - PM - To verify that, expanded page block can be manually collapsed again|
  |TC - LWC - Forms - collapse page block - PM - To verify that, no UI overlap or alignment issues after collapse|
  |TC - LWC - Forms - collapse page block - PM - To verify that, if “Enable Collapse By Default” config is enabled under Page Block Config then user should expand page block icons when click on expand icon.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block            | Enable Collapse By Default | false             | General Review Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | General Review Form | Name                      | PB-12631                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I "Expanded" page block contaninig value "Site Visit Overview"
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Site Visit Overview"
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.

  @FW-1473 @US-FW-1439
  Scenario: TC - LWC - Forms - collapse page block - PM - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block            | Enable Collapse By Default | false             | General Review Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | General Review Form | Name                      | PB-12631                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.

  @FW-1476 @FW-1477 @US-FW-1439
  Scenario: TC - LWC - Forms - collapse page block - PM - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page
  |TC - LWC - Forms - collapse page block - PM - To verify that, system should not remember user’s last expand/collapse preference after logout and re-login|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block            | Enable Collapse By Default | false             | General Review Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | General Review Form | Name                      | PB-12631                   |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "3" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I refresh the page
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "3" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I refresh the page
    Then I softly see the page block "Site Visit Overview" on the layout with the toggle button in the "down" position.

  @FW-1484 @FW-1485 @FW-1486 @FW-1487 @FW-1489 @FW-1489 @FW-1490 @FW-1493 @US-FW-1439
  Scenario: TC - LWC - Forms- collapse page block - SPI - To verify that, page block should be collapsed on initial layout load, when “Enable Collapse By Default” config is enabled under Page Block Config
  |TC - LWC - Forms - collapse page block - SPI - To verify that, page block remains collapsed after refresh, when “Enable Collapse By Default” config is enabled under Page Block|
  |TC - LWC - Forms - collapse page block - SPI- To verify that, user can manually expand a collapsed page block|
  |TC - LWC - Forms - collapse page block - SPI - To verify that, expanded page block can be manually collapsed again|
  |TC - LWC - Forms - collapse page block - SPI - To verify that, page block remains collapsed after navigating within the page, when “Enable Collapse By Default” config is enabled under Page Block Config|
  |TC - LWC - Forms - collapse page block - SPI - To verify that, if “Enable Collapse By Default” config is enabled under Page Block Config then user should expand page block icons when click on expand icon.|
  |TC - LWC - Forms - collapse page block - SPI - To verify that, system remembers user’s last expand/collapse preference after page refresh or navigating within the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Enable Collapse By Default | false             | Program Specific Application form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                  | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Enable Collapse By Default | true          | Program Specific Application form | Name                      | PB-11928                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see the page block "Project Characteristics" on the layout with the toggle button in the "down" position.
    And I refresh the page
    When I "Expanded" page block contaninig value "Project Characteristics"
    Then I softly see the page block "Project Characteristics" on the layout with the toggle button in the "up" position.
    When I "Collapse" page block contaninig value "Project Characteristics"
    Then I softly see the page block "Project Characteristics" on the layout with the toggle button in the "down" position.