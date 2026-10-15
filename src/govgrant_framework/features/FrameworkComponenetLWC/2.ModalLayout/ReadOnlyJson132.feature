@readonlyjson @modal
Business Need: Lwc End to end flows

  @363561 @363562
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify read only expression for fields can be used using Left operand as ‘Field’    Given I have "default" configuration as below:
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                         | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJson363561And363562 | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363568 @363573
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/PM - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Internal' as Right Operand then field should be read only for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                         | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJson363568And363573 | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363581
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then field should be read only for all applicant users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                         | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJson363568And363573 | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363585 @379071 @lwcsanity @lwcsanitypagelayout
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then field should be read only for all applicant users.
  |Sanity Testing- Page Layout- SPI- To verify on View page layout, fields are not editable.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                             | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserTypeInApplicant | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    Then I see field "Description1__c" is not editable

  @363588 @wip
  Scenario Outline:LWC - Flex Edit Layout - Read Only Expression Builder - PM - UI - To verify that when user select User type as Left Operand, 'IN' as operator and 'Reviewer' as Right Operand then field should be read only for all reviewer users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                            | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserTypeInReviewer | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363597 @363611
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then field should be read only for edit layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                       | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonContextInEdit | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363613
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then field should be read only for edit layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                       | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonContextInEdit | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @363623 @363624
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - PM - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then field should be read only for State As Grantor app.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                 | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserAppInStateAsGrantor | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363625 @wip
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then field should be read only for State As Grantor app.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                 | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserAppInStateAsGrantor | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is read-only field
    Then I see field "Description1__c" is not editable

  @363677 @363681
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then field should be read only for all users except Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                               | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserTypeNotInInternal | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I do not see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363696
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Internal' as Right Operand then field should be read only for all users except Internal users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                               | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserTypeNotInInternal | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @363977 @363978
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then field should be read only except create layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserContextNotInCreate | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @363981
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then field should be read only except create layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonUserContextNotInCreate | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364334 @364338
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm- Config - To Verify if we configure multiple read only expressions separated by ‘OR’  operator
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                          | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonMultipleReadOnlyExpressionsInternalSeparatedByOR | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364342 @364374
  Scenario:
  |LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure multiple read only expressions separated by ‘OR’  operator|
  |LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - Verify if we configure multiple read only expressions on same time |
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                          | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonMultipleReadOnlyExpressionsExternalSeparatedByOR | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364352 @364357 @364370 @364373
  Scenario Outline:
  |LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we configure multiple read only expressions separated by ‘AND’  operator|
  |LWC - Flex Edit Layout - Read Only Expression Builder - PM - UI - Verify if we configure multiple read only expressions on same time |
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonMultipleReadOnlyExpressionsAndOperator | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364625 @364626
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘IN’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                            | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusDraft | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364627 @363563
  Scenario:
  |LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘IN’ that field should read only for values in right operand.|
  |LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify read only expression for fields can be used using Left operand as ‘Field’|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                              | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusCreated | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364631 @364632
  Scenario Outline:LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression using Left operand as ‘Field’ and operator as ‘NOT IN’ that field should read only for values except values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusNotInSubmitForApproval | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364633
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression using Left operand as ‘Field’ and operator as ‘NOT IN’ that field should read only for values except values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusNotInSubmitForApproval | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364656 @364657
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression using Left operand as ‘Field’ and operator as ‘NOT EQUALS’ that field should read only for values except values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                 | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusNotEqualsSubmitForApproval | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364658
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression using Left operand as ‘Field’ and operator as ‘NOT EQUALS’ that field should read only for values except values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                 | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusNotEqualsSubmitForApproval | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364670 @364702
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘EQUALS’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                               | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusEqualsTo | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364704
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘EQUALS’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                 | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldInStatusNotEqualsSubmitForApproval | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364705 @364706
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘Contains’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ServiceAreaGrantor | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                | ServiceAreaGrantor | Name                      | PBD-42090                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldContainsTextDraft | ServiceAreaGrantor | Name                      | PBD-42090                  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see field "InternalUniqueID__c" is read-only field
    And I pause execution for "10" seconds
    Then I see field "InternalUniqueID__c" is read-only field

    Examples:
      | Users |
      | PM    |

  @364708
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘Field’ and operator as ‘Contains’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                 | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldContainsTextcreate | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "111" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is read-only field
    Then I see field "Description1__c" is not editable

  @364717 @364718
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we use Left operand as ‘Field’ and operator as ‘LESS THAN EQUALS’ that field should be read only for values greater than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                               | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldLessThanEqualsTo | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "5000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    And I pause execution for "8" seconds
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364725 @364728
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we use Left operand as ‘Field’ and operator as ‘GREATER THAN EQUALS’ that field should be read only for values less than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldGreaterThanEquals | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "5000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364742 @364743
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we use Left operand as ‘Field’ and operator as ‘LESS THAN’ that field should be read only for values greater than value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                       | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldLessThan | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "3000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364745 @364747
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we use Left operand as ‘Field’ and operator as ‘GREATER THAN’ that field should be read only for values less than value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                          | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonFieldGreaterThan | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "7000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @368337 @368338
  Scenario Outline:
  |LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To verify that when user select Profile as Left Operand, 'IN' as operator and 'System Administrator' as Right Operand then field should be read only for all admin users.|
  |LWC - Flex Edit Layout - Read Only Expression Builder - PM - Config - To verify that when user select Profile as Left Operand, 'IN' as operator and 'PM' as Right Operand then field should be read only for all PM users.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                        | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <Read Only Expression JSON> | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "7000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users | Read Only Expression JSON                                      |
      | Admin | govgrants_config:readOnlyJsonProfileAdminInSystemAdministrator |
      | EXE   | govgrants_config:readOnlyJsonProfileInEXE                      |

  @368340 @368342
  Scenario Outline:
  |LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To verify that when user select Profile as Left Operand, 'NOT IN' as operator and 'PM' as Right Operand then field should be read only for all users except PM users.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                         | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonProfileNotInEXE | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "7000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | Admin |
      | EXE   |

  @368344
  Scenario Outline:|LWC - Flex Edit Layout - Read Only Expression Builder - PM - Config- To verify that when user select Profile as Left Operand, 'NOT IN' as operator and 'System Administrator' as Right Operand then field should be read only for all users except admin users.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                         | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonProfileNotInSystemAdministrator | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "7000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | EXE   |

  @368347 @368348
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config- To verify that when user select Profile as Left Operand, 'NOT IN' as operator and 'SPI' as Right Operand then field should be read only for all users except SPI users.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                         | Grantor State Program | Name                      | PBD-35335                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonProfileNotInSPI | Grantor State Program | Name                      | PBD-35335                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "7000" into field "Abbreviation__c"
    And I click modal button "Save and Continue"
    Then I see field "Abbreviation__c" is read-only field
    Examples:
      | Users |
      | PM    |

  @364389
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘Contains’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                          |
      | Admin | govgrants_config:readOnlyJsonDollarUserContainsAgencyForAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserContainsAgencyForPM    |

  @364403
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘Contains’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                  | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserContainsInternalUniqueIdForSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I softly see field "Description1__c" is not editable

  @364411 @364414
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/pm - Config - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘IN’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                              |
      | Admin | govgrants_config:readOnlyJsonDollarUserInInternalUniqueIdForAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserInInternalUniqueIdForPM    |

  @364430
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘IN’ that field should read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                            | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserInInternalUniqueIdForSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364433 @364435
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/PM - Config - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘NOT IN’ that field should not be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                             |
      | Admin | govgrants_config:readOnlyJsonDollarUserNotInInternalUniqueIdTest |
      | PM    | govgrants_config:readOnlyJsonDollarUserNotInInternalUniqueIdTest |

  @364436
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘NOT IN’ that field should not be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserNotInInternalUniqueIdTest | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364438 @364439
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘EQUALS’ that field should be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                               |
      | Admin | govgrants_config:readOnlyJsonDollarUserEqualsInternalUniqueIdAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserEqualsInternalUniqueIdPM    |

  @364440
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for any field using Left operand as ‘$ User’ and operator as ‘EQUALS’ that field should be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserEqualsInternalUniqueIdSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364443 @364444
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we configure read only expression for field using Left operand as ‘$ User’ and operator as ‘NOT EQUALS’ that field should not be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                             |
      | Admin | govgrants_config:readOnlyJsonDollarUserNotEqualsInternalUniqueId |
      | PM    | govgrants_config:readOnlyJsonDollarUserNotEqualsInternalUniqueId |

  @364445
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we configure read only expression for field using Left operand as ‘$ User’ and operator as ‘NOT EQUALS’ that field should not be read only for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserNotEqualsInternalUniqueId | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364480 @364483
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/PM - Config - To Verify if we use Left operand as ‘$ User’ and operator as ‘LESS THAN EQUALS’ that field should be read only for values greater than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                                       |
      | Admin | govgrants_config:readOnlyJsonDollarUserLessThanEqualsInternalUniqueIdAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserLessThanEqualsInternalUniqueIdPM    |

  @364483
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we use Left operand as ‘$ User’ and operator as ‘LESS THAN EQUALS’ that field should be read only for values greater than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                            | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                     | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserLessThanEqualsInternalUniqueIdSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364485 @364486
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/PM - Config - To Verify if we use Left operand as ‘$ User’ and operator as ‘GREATER THAN EQUALS’ that field should be read only for values less than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                                          |
      | Admin | govgrants_config:readOnlyJsonDollarUsergreaterThanEqualsInternalUniqueIdAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUsergreaterThanEqualsInternalUniqueIdPM    |

  @364488
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we use Left operand as ‘$ User’ and operator as ‘GREATER THAN EQUALS’ that field should be read only for values less than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                               | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                        | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUsergreaterThanEqualsInternalUniqueIdSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364527 @364531
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin/PM - Config - To Verify if we use Left operand as ‘$ User’ and operator as ‘LESS THAN’ that field should be read only for values less than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                                 |
      | Admin | govgrants_config:readOnlyJsonDollarUserLessThanInternalUniqueIdAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserLessThanInternalUniqueIdPM    |

  @364534
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we use Left operand as ‘$ User’ and operator as ‘LESS THAN’ that field should be read only for values less than or equals value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                               | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserLessThanInternalUniqueIdSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @364594 @364595
  Scenario Outline: LWC - Flex Edit Layout - Read Only Expression Builder - Admin - Config - To Verify if we use Left operand as ‘$ User’ and operator as ‘GREATER THAN’ that field should be read only for values less than value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                   | Grantor State Program | Name                      | PBD-42103                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | <ReadOnlyJsonForField> | Grantor State Program | Name                      | PBD-42103                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field "ORGName1__c" is read-only field
    Examples:
      | Users | ReadOnlyJsonForField                                                    |
      | Admin | govgrants_config:readOnlyJsonDollarUserGreaterThanInternalUniqueIdAdmin |
      | PM    | govgrants_config:readOnlyJsonDollarUserGreaterThanInternalUniqueIdPM    |

  @364596
  Scenario: LWC - Flex Edit Layout - Read Only Expression Builder - SPI - UI - To Verify if we use Left operand as ‘$ User’ and operator as ‘GREATER THAN’ that field should be read only for values less than value in right operand.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                                  | Recipient Pre-Application | Name                      | PBD-42091                  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:readOnlyJsonDollarUserGreaterThanInternalUniqueIdSPI | Recipient Pre-Application | Name                      | PBD-42091                  |
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
    When I wait for "5" seconds
    When I click modal button "Save and Continue"
    Then I see field "Description1__c" is not editable

  @331260 @331261 @351770 @351776
  Scenario Outline:LWC - Flex View Layout - Page Block Hide Expression Builder - Adminpm - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page block should be hidden for State As Grantor app
  |LWC - Flex Edit Layout - Page Block Hide Expression Builder - Admin/pm - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'State As Grantor' as Right Operand then page block should be hidden for State As Grantor app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                  | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppInStateAsGrantor | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @331370 @331371 @351899 @351900
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin/PM - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page block should be hidden except State As Grantee app
  |LWC - Flex Edit Layout - PB Hide Expression Builder - Admin/PM - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'State As Grantee' as Right Operand then page block should be hidden except State As Grantee app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                            | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                     | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppInStateAsGranteeApp | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
      | PM    |

  @331372 @331375
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Admin' as Right Operand then page block should be hidden except Admin  app
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                            | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                     | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppInStateAsGranteeApp | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
      | PM    |

  @331508 @351916 @351917
  Scenario: LWC - Flex View Layout - PB Hide Expression Builder - Admin/pm - Config - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'Recipient' as Right Operand then page block should be hidden for recipient app
  |LWC - Flex Edit Layout - PB Hide Expression Builder - PM/admin - UI - To verify that when user select 'User App' as Left Operand, 'IN' as operator and 'Recipient' as Right Operand then page block should be hidden for recipient app|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                     | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                              | Annoucement External Profile-FOA | Name                      | PB-12374                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppInReciepient | Annoucement External Profile-FOA | Name                      | PB-12374                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I do not see "Opportunity Information" page block displayed

  @331510 @331511 @351919 @351917
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin/PM - Config - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page block should be hidden for apps except recipient app.
  |LWC - Flex Edit Layout - PB Hide Expression Builder - Admin/PM - UI - To verify that when user select 'User App' as Left Operand, 'NOT IN' as operator and 'Recipient' as Right Operand then page block should be hidden for apps except recipient app.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                 | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppNotInReciepient | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
      | PM    |

  @338439 @338441 @351941 @351942
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin/PM - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  operator
  |LWC - Flex Edit Layout - PB Hide Expression Builder - Admin/pm - Config - To Verify if we configure multiple hide expressions separated by ‘AND’  operator|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                     | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                              | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppNotInReciepientAndNotGrantee | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
      | PM    |

  @338449 @338470 @338474 @338480 @351943 @351944 @351947 @351948 @382091 @lwcsanity
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin/pm - Config - To Verify if we configure multiple hide expressions separated by ‘OR’  operator
  |LWC - Flex View Layout - PB Hide Expression Builder - Admin/pm - Config - Verify we can configure multiple hide expressions on same time |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                    | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                             | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:hidePageBlockUserAppNotInReciepientORNotGrantee | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users |
      | PM    |

  @338484 @338491 @351949 @351950
  Scenario Outline: LWC - Flex View/edit Layout - PB Hide Expression Builder - Admin/PM - Config - To Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Contains’ that block should not display on UI for values in right operand.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                   | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <ReadOnlyJsonForField> | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users | ReadOnlyJsonForField                                  |
      | Admin | govgrants_config:hidePageBlockDollerUserContainsAdmin |
      | PM    | govgrants_config:hidePageBlockDollerUserContainsPM    |

  @338506 @338510 @338496 @338501 @351953 @351954 @351955 @351957
  Scenario Outline: LWC - Flex View/edit Layout - PB Hide Expression Builder- Admin/PM - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘In’ that page block should not display on UI for values in right operand
  |LWC - Flex View/edit Layout - PB Hide Expression Builder - Admin/PM - UI - To Verify hide expression for page block can be used using Left operand as ‘Field’|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                   | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <ReadOnlyJsonForField> | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I do not see "Information" page block displayed
    Examples:
      | Users | ReadOnlyJsonForField                             |
      | Admin | govgrants_config:hidePageBlockFieldInStatusDraft |
      | PM    | govgrants_config:hidePageBlockFieldInStatusDraft |

  @338515 @351959 @351962
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Not In’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                   | Strategic Planning Grantor | Name                      | PB-12953                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <ReadOnlyJsonForField> | Strategic Planning Grantor | Name                      | PB-12953                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see "Information" page block displayed
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see "Information" page block displayed
    Examples:
      | Users | ReadOnlyJsonForField                                |
      | Admin | govgrants_config:hidePageBlockFieldNotInStatusDraft |