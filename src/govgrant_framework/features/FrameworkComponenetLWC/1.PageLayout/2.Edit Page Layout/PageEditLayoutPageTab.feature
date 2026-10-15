@PageEditLayoutPageTab @PageLayout @PageLayout2
Business Need: Page Edit Layout Page Tab Scenario

  @320308 @320309
  Scenario Outline: LWC-Flex Edit Layout - Page Tab - Config- Admin- To verify 'Overview' tab is not available on view layout when "Is Active" checkbox is unchecked in page tab config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | false         | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | Admin |

  @320310 @320312 @320313 @320319 @320320 @320322
  Scenario Outline:
  |LWC-Flex Edit Layout - Page Tab - Config - Admin/PM - To verify that when 'Highlights Panel' checkbox is unchecked then tab should be display in tabs line|
  |LWC-Flex Edit Layout - Page Tab- Config- Admin- To verify 'Overview' tab is available on view layout when "Is Active" checkbox is checked in page tab config|
  |LWC-Flex Edit Layout - Page Tab - Config- Admin- To verify "Header Instruction Text" is rendering on left top of page tab same as text added in "Header Instruction Text" on page tab config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Highlights Panel?       | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active               | true                               | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Highlights Panel?       | false                              | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Test Automation header instruction | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Overview" Tab title displays on pagelayout
    When I navigate to "Overview" sub tab
    Then I see "Test Automation header instruction" shown as header instruction text
    Examples:
      | Users |
      | PM    |

  @337279 @337280 @337289 @337292 @320256 @320266 @320237 @320238 @320271 @320273
  Scenario Outline:
  |LWC-Flex View Layout - Page Tab- Config - Admin/PM - To verify tab is rendering as per sort order on UI.|
  |LWC-Flex View Layout - Page Tab - Config - Admin/PM - To verify that when 'Highlights Panel' checkbox is checked then tab should be Highlighted above the tabs.|
  |LWC-Flex Edit Layout - Page Tab - UI- Admin/PM - To verify that tab icon should be rendered on UI as added in 'Tab Icon' display tab setting config.|
  |LWC-Flex View Layout - Fields - UI - Admin/PM - To verify that the tab is rendering on 1st number in page layout if 'Sort Order' gives as '1' in page tab detail config.|
  |LWC-Flex View Layout - Fields - Config - Admin/PM- To verify that the tab is rendering at last on page layout if 'Sort Order' gives as '100' in page tab detail config and if doesn't have that many fields in page tabs.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active         | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Highlights Panel? | true              | ApiGeneratedId:1 |
      | Page Tabs Config      | Sort Order        | 0                 | ApiGeneratedId:2 |
      | Page Tabs Config      | Sort Order        | 30                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active         | true          | ServiceAreaGrantor | Name                      | TAB-4632                   |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | true          | ServiceAreaGrantor | Name                      | TAB-4632                   |
      | Page Tabs Config:Page Layout Action | Sort Order        | 1             | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Sort Order        | 100           | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see field "Status" as "Draft"
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Overview" shown at number "0" inside subtabs
    Then I see "Messages" shown at number "4" inside subtabs
    Examples:
      | Users |
      | PM    |

  @320341 @320341 @337259 @337260
  Scenario Outline:
  |LWC-Flex Edit Layout - Page Tab - UI - Admin/pm - To verify that tab title should be rendered on UI same as added in 'Tab Title' in Page tab details config.|
  |LWC-Flex Edit Layout - Page Tab - UI - PM - To verify "Header Instruction Text" is rendering properly on tab if added long value in "Header Instruction Text" field on page tab config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Tab Title               | Overview          | ApiGeneratedId:1 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active               | true                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Tab Title               | Overview             | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | <header instruction> | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see field "Status" as "Draft"
    Then I see "Overview" subtab is present in page details
    Then I see "<header instruction>" shown as header instruction text
    Examples:
      | Users | header instruction                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | PM    | Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industrys standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book It has survived not only five centuries but also the leap into electronic typesetting remaining essentially unchanged It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum |

  @337324 @337326
  Scenario Outline:
  |LWC-Flex Edit Layout - Fields - UI - Admin/PM - To verify that the tab is rendering at last on page layout if 'Sort Order' gives as '100' in page tab detail config and if doesn't have that many fields in page tabs.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active  | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Sort Order | 0                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active  | true          | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Sort Order | 100           | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see field "Status" as "Draft"
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Overview" shown at number "4" inside subtabs
    Examples:
      | Users |
      | PM    |

  @337570
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that Tab should be hide for System Administrator profile.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true                 | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | System Administrator | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | ADMIN |

  @337572 @337605 @337606
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - UI - To verify that when user select 'PM' in 'Hide For Profile' then that tab should be hide for PM profile on UI.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'PM' in 'Hide For Profile' then that page tab should be hide for PM profile.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that Tab should be hide for System Administrator profile.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337577 @bug-448585
  Scenario: LWC - Flex Edit Layout -Page Tab Hide Logic - SPI - Config - To verify that when user select 'SPI' in 'Hide For Profile' then that page tab should be hide for SPI profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | SPI           | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout

  @337602 @337604
  Scenario Outline:LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'PO' in 'Hide For Profile' then that page tab should be hide for PO profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337608 @337609
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that page tab should be hide for all Internal users.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - UI - To verify that when user added 'Internal' in 'Hide For User' then that page tab should be hide for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active     | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide for User | Internal      | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337611
  Scenario: LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user added 'Applicant' in 'Hide For User' then that page tab should be hide for all applicant users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide For User | Applicant     | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout

  @337617 @wip-scenarionotapplicableforFOuser @wip
  Scenario Outline: LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'FO' in 'Hide For Profile' then that page tab should be hide for FO profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | FO            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | FO    |

  @337621 @337623
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'EXE' in 'Hide For Profile' then that page tab should be hide for EXE profile on UI.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - UI - To verify that when user select 'EXE' in 'Hide For Profile' then that page tab should be hide for EXE profile on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | EXE           | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | EXE   |

  @337624 @337625 @337534 @337536
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'View' in 'Hide for Context' then that page tab should be hide for View layout.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - UI - To verify that when user select 'View' in 'Hide for Context' then that page tab should be hide for View layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | View          | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337625 @337626 @337628
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - UI - To verify that when user select 'Edit' in 'Hide for Context' then that page tab should be hide for edit layout.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'Edit' in 'Hide for Context' then that page tab should be hide for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | Edit          | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337812 @337816
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all Internal users.|
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeInInternal | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337820
  Scenario:
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all Applicant users.|
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - SPI - UI - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all Applicant users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeInApplicant | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout

  @337828
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page tab should be hidden for view layout.|
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page tab should be hidden for view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                     | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForContextInView | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337832 @337833
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page tab should be hidden for edit layout.|
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page tab should be hidden for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                     | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForContextInEdit | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337848 @337849
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden for State As Grantor app|
  |LWC - Flex Edit Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden for State As Grantor app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppInStateAsGrantor | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337854
  Scenario Outline:
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppInStateAsGrantor | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | Admin |

  @337858 @337859
  Scenario Outline: |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all users except Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                             | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInInternal | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337861 @337862
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all users except Applicant users.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all users except Applicant users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInApplicant | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337863 @337864 @wip
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Reviewer' as Right Operand then page tab should be hidden for all users except reviewer users.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Reviewer' as Right Operand then page tab should be hidden for all users except reviewer users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInReviewver | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Related Log" subtab is present in page details

    Examples:
      | Users |
      | PM    |

  @337867 @337871
  Scenario Outline: |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page tab should be hidden for all layouts except view layout.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page tab should be hidden for all layouts except view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                         | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInView | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337873 @337875
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page tab should be hidden for all layouts except edit layout.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page tab should be hidden for all layouts except edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                         | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInEdit | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337876 @337878
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page tab should be hidden for all layouts except create layout.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page tab should be hidden for all layouts except create layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInCreate | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337879 @337882
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden except State As Grantor app|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden except State As Grantor app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInStateAsGrantor | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Related Log" subtab is present in page details

    Examples:
      | Users |
      | PM    |

  @337898 @337903
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page tab should be hidden except State As Grantee app|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page tab should be hidden except State As Grantee app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInStateAsGranee | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337916
  Scenario:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for recipient app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppInReciepient | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout

  @337925 @337925
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for apps except recipient app.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for apps except recipient app.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInReciepient | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338280 @338281 @338288
  Scenario Outline:LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  Operator
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure multiple hide expressions separated by ‘AND’  operator|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure multiple hide expressions on same time |
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure multiple hide expressions on same time |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInAndProfileInPM | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338284 @338286
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInOrProfileInPM | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338293 @338288 @338291
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInOrProfileInPM | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338293 @338295
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | ServiceAreaGrantor | Name                      | TAB-4633                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserInIsApplicant | ServiceAreaGrantor | Name                      | TAB-4633                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "History" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338296 @338298
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To Verify hide expression for page tab can be used using Left operand as ‘Field’|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To Verify hide expression for page tab can be used using Left operand as ‘Field’|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldEqualToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338300 @338302
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldInToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338303 @338305
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldNotInToFreeTextStatusFailed | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338308 @338310
  Scenario Outline:
  |LWC - Flex Edit Layout -PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Equals’ that page ta should not display on edit layout for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Equals’ that page tab should not display on edit layout for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldEqualsToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338311 @338314
  Scenario Outline:
  |LWC - Flex Edit Layout -PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not Equals’ that page tab should display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI  - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not Equals’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldNotEqualsToFreeTextStatusActive | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338316 @338317
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page tab should not display on UI for values greater than value in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page tab should not display on UI for values greater than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanEqualsToFreeText2024 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338319 @338320
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ tab should not display on UI for values lesser than value in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ page tab should not display on UI for values lesser than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldGreaterThanEqualsToFreeText2023 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338322 @338323
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ tab should not display on UI for values greater than equals to the value in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ page tab should not display on UI for values greater than equals to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanFreeText2030 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338325 @338337
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ then tab should not display on UI for values lesser than to the value in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ then tab should not display on UI for values lesser than to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanFreeText2030 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338339 @338338
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldContainsFreeTextDraf | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338340 @338341
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserInAutomation | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338342 @338343
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for page tab action using Left operand as ‘$ User’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                            | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserNotInHello | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338345 @338347
  Scenario Outline:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Equals’ that page tab should not display on UI for values in right operand|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Equals’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserEqualsToFreetextAutomation | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338345 @338347 @338260 @338261
  Scenario Outline:
  |LWC - Flex Edit/View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Equals’ that page tab should not display on UI for values in right operand|
  |LWC - Flex Edit/View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Equals’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserEqualsToFreetextAutomation | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

###########################View page layout Test suite: Page Tab (Suite ID: 320103)###################

  @320326 @320331 @320333 @320335 @320339 @320340 @337285 @337287
  Scenario Outline:
  |LWC-Flex Edit Layout - Page Tab- Config - Admin/PM - To verify tab is rendering as per sort order on UI.|
  |LWC-Flex Edit Layout - Page Tab - Config - Admin/PM - To verify that when 'Highlights Panel' checkbox is checked then tab should be Highlighted above the tabs.|
  |LWC-Flex Edit Layout - Page Tab - UI- Admin/PM - To verify that tab icon should be rendered on UI as added in 'Tab Icon' display tab setting config.|
  |LWC-Flex Edit Layout - Fields - UI - Admin/PM - To verify that the tab is rendering on 1st number in page layout if 'Sort Order' gives as '1' in page tab detail config.|
  |LWC-Flex Edit Layout - Fields - Config - Admin/PM- To verify that the tab is rendering at last on page layout if 'Sort Order' gives as '100' in page tab detail config and if doesn't have that many fields in page tabs.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active         | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Highlights Panel? | true              | ApiGeneratedId:1 |
      | Page Tabs Config      | Sort Order        | 0                 | ApiGeneratedId:2 |
      | Page Tabs Config      | Sort Order        | 30                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active         | true          | ServiceAreaGrantor | Name                      | TAB-4632                   |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | true          | ServiceAreaGrantor | Name                      | TAB-4632                   |
      | Page Tabs Config:Page Layout Action | Sort Order        | 1             | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Sort Order        | 100           | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I softly see field "Status" as "Draft"
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Overview" shown at number "0" inside subtabs
    Then I see "Messages" shown at number "4" inside subtabs
    Examples:
      | Users |
      | PM    |

  @337306 @337308
  Scenario Outline:
  |LWC-Flex View Layout - Page Tab - Config- Admin- To verify that the tab is rendering at first on page layout if 'Sort Order' gives as negative in page tab detail config.|
  |LWC-Flex View Layout - Page Tab - UI - PM - To verify that the tab is rendering at first on page layout if 'Sort Order' gives as negative in page tab detail config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName  | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Sort Order | 0                 | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName  | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Sort Order | -1            | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I see "Overview" shown at number "0" inside subtabs
    Examples:
      | Users |
      | PM    |

  @337493
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that Tab should be hide for System Administrator profile.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true                 | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | System Administrator | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | Admin |

  @337498
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Logic - PM - UI - To verify that when user select 'PM' in 'Hide For Profile' then that tab should be hide for PM profile on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337500 @337501 @bug-448585
  Scenario: LWC - Flex View Layout -Page Tab Hide Logic - SPI - Config - To verify that when user select 'SPI' in 'Hide For Profile' then that page tab should be hide for SPI profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | SPI           | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I do not see "Messages" Tab title displays on pagelayout

  @337503 @337504
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'PO' in 'Hide For Profile' then that page tab should be hide for PO profile.|
  |LWC - Flex View Layout - Page Tab Hide Logic - PO - UI - To verify that when user select 'PO' in 'Hide For Profile' then that page tab should be hide for PO profile on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337505 @337606
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'PM' in 'Hide For Profile' then that page tab should be hide for PM profile.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that Tab should be hide for System Administrator profile.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337507 @337508
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that page tab should be hide for all Internal users.|
  |LWC - Flex View Layout - Page Tab Hide Logic - PM - UI - To verify that when user added 'Internal' in 'Hide For User' then that page tab should be hide for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active     | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide for User | Internal      | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337511
  Scenario: LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user added 'Applicant' in 'Hide For User' then that page tab should be hide for all applicant users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide For User | Applicant     | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I do not see "Messages" Tab title displays on pagelayout

  @337517
  Scenario Outline: LWC - Flex View Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'FO' in 'Hide For Profile' then that page tab should be hide for FO profile on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | PM            | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337521 @337524
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'EXE' in 'Hide For Profile' then that page tab should be hide for EXE profile on UI.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - UI - To verify that when user select 'EXE' in 'Hide For Profile' then that page tab should be hide for EXE profile on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide For Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide For Profile | EXE           | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | EXE   |

  @337539 @337540 @337628
  Scenario Outline:
  |LWC - Flex Edit Layout - Page Tab Hide Logic - PM - UI - To verify that when user select 'Edit' in 'Hide for Context' then that page tab should be hide for edit layout.|
  |LWC - Flex Edit Layout - Page Tab Hide Logic - Admin - Config - To verify that when user select 'Edit' in 'Hide for Context' then that page tab should be hide for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | Edit          | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337636 @337637
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all Internal users.|
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeInInternal | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337640 @337695
  Scenario:
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all Applicant users.|
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - SPI - UI - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all Applicant users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeInApplicant | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I do not see "Messages" Tab title displays on pagelayout

  @337699 @337701
  Scenario Outline:
  |LWC - Flex view Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page tab should be hidden for view layout.|
  |LWC - Flex view Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page tab should be hidden for view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                     | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForContextInView | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337702 @337703
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page tab should be hidden for edit layout.|
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page tab should be hidden for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                     | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForContextInEdit | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "Edit" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337711 @337713
  Scenario Outline:
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden for State As Grantor app|
  |LWC - Flex View Layout - Page Tab Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden for State As Grantor app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppInStateAsGrantor | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337734 @337741
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all users except Internal users.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then page tab should be hidden for all users except Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                             | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInInternal | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337749 @337752
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all users except Applicant users.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Applicant' as Right Operand then page tab should be hidden for all users except Applicant users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInApplicant | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337753 @337755 @314798
  Scenario Outline:LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Reviewer' as Right Operand then page tab should be hidden for all users except reviewer users.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Reviewer' as Right Operand then page tab should be hidden for all users except reviewer users.|
  |LWC-Flex View Layout - Page Tab - Config - Admin - To verify that when 'Highlights Panel' checkbox is unchecked then tab should be display in tabs line|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInReviewver | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    And I pause execution for "2" seconds
    Then I do not see "Related Log" subtab is present in page details

    Examples:
      | Users |
      | PM    |

  @337757 @337760
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page tab should be hidden for all layouts except view layout.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page tab should be hidden for all layouts except view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                         | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInView | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Related Log" Tab title displays on pagelayout

    Examples:
      | Users |
      | PM    |

  @337761 @337875
  Scenario Outline:LWC - Flex Edit Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page tab should be hidden for all layouts except edit layout.|
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page tab should be hidden for all layouts except edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                         | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInEdit | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" subtab is present in page details

    Examples:
      | Users |
      | PM    |

  @337766 @337768
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page tab should be hidden for all layouts except create layout.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page tab should be hidden for all layouts except create layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInCreate | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337769 @337774
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden except State As Grantor app|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantor' as Right Operand then page tab should be hidden except State As Grantor app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInStateAsGrantor | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337776 @337780
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page tab should be hidden except State As Grantee app|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page tab should be hidden except State As Grantee app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInStateAsGranee | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @337789
  Scenario:
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for recipient app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | Recipient Pre-Application | Name                      | TAB-4402                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppInReciepient | Recipient Pre-Application | Name                      | TAB-4402                   |
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
    And I wait for "7" seconds
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I do not see "Messages" Tab title displays on pagelayout

  @337793 @337797
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for apps except recipient app.|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page tab should be hidden for apps except recipient app.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserAppNotInReciepient | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338151 @338154 @338172 @338174
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  Operator|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure multiple hide expressions separated by ‘AND’  operator|
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure multiple hide expressions on same time |
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure multiple hide expressions on same time |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInAndProfileInPM | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338169 @338171
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure multiple hide expressions separated by ‘OR’  operator|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForUserTypeNotInOrProfileInPM | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338177 @338178
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | ServiceAreaGrantor | Name                      | TAB-4633                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserInIsApplicant | ServiceAreaGrantor | Name                      | TAB-4633                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "History" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338180 @338183
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - To Verify hide expression for page tab can be used using Left operand as ‘Field’|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - To Verify hide expression for page tab can be used using Left operand as ‘Field’|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldEqualToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338186 @338190
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldInToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338191 @338194
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldNotInToFreeTextStatusFailed | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338198 @338199
  Scenario Outline:
  |LWC - Flex View Layout -PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Equals’ that page ta should not display on edit layout for values in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Equals’ that page tab should not display on edit layout for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldEqualsToFreeTextStatusDraft | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338200 @338202
  Scenario Outline:
  |LWC - Flex View Layout -PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not Equals’ that page tab should display on UI for values in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI  - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Not Equals’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4629                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldNotEqualsToFreeTextStatusActive | ServiceAreaGrantor | Name                      | TAB-4629                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Related Log" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338205 @338209
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page tab should not display on UI for values greater than value in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page tab should not display on UI for values greater than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanEqualsToFreeText2024 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338214 @338215
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ tab should not display on UI for values lesser than value in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ page tab should not display on UI for values lesser than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldGreaterThanEqualsToFreeText2023 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338218 @338232
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ tab should not display on UI for values greater than equals to the value in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ page tab should not display on UI for values greater than equals to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanFreeText2030 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338235 @338237
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ then tab should not display on UI for values lesser than to the value in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ then tab should not display on UI for values lesser than to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4635                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldLessThanFreeText2030 | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Overview" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Overview" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338239 @338241
  Scenario Outline:
  |LWC - Flex View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand|
  |LWC - Flex View Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘Field’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForFieldContainsFreeTextDraf | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338244 @338256
  Scenario Outline:
  |LWC - Flex view Layout - PT Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
  |LWC - Flex view Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘In’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserInAutomation | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338258 @338259
  Scenario Outline:
  |LWC - Flex view Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression for page tab action using Left operand as ‘$ User’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
  |LWC - Flex view Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Not In’ that page tab should display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                            | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserNotInHello | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338348 @338350 @338264 @338265
  Scenario Outline: LWC - Flex Edit/View Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ tab should not display on UI for values greater than value in right operand
  |LWC - Flex Edit Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ page should not display on UI for values greater than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserLessthanEqualsToOrganizationid | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338352 @338353 @338267 @338268
  Scenario Outline: LWC - Flex Edit/view Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ page should not display on UI for values lesser than value in right operand
  |LWC - Flex Edit/view Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ page should not display on UI for values lesser than value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                          | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                   | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserGreaterThanEqualsToOrganizationid | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338354 @338355 @338269 @338270
  Scenario Outline: LWC - Flex Edit/view Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than equals to the value in right operand
  |LWC - Flex Edit/view Layout - PT Hide Expression Builder - PM - UI  - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than equals to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserLessThanOrganizationid | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338357 @338358 @338272 @338273
  Scenario Outline: LWC - Flex Edit/view Layout - PT Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equal to the value in right operand
  |LWC - Flex Edit/view Layout - PT Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equals to the value in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserGreaterThanOrganizationid | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |

  @338359 @338361 @338275 @338276
  Scenario Outline: LWC - Flex Edit Layout - PT Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand
  |LWC - Flex Edit Layout - PT Hide Expression Builder- PM - UI - Verify if we configure hide expression for any page tab using Left operand as ‘$ User’ and operator as ‘Contains’ that page tab should not display on UI for values in right operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | ServiceAreaGrantor | Name                      | TAB-4631                   |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:hideTabForDollarUserContainsThanOrganizationid | ServiceAreaGrantor | Name                      | TAB-4631                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I do not see "Messages" Tab title displays on pagelayout
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "{focusarea:focusAreaTableId}" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside table
    Then I do not see "Messages" Tab title displays on pagelayout
    Examples:
      | Users |
      | PM    |