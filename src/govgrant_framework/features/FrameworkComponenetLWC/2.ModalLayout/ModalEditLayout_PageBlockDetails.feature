@dilippagelayout @modal
Business Need: Modal Edit Layout Page Block Details

  @checkpassword
  Scenario: in this scenario we are test all password are working
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal


  @364027 @364028
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as true then field displays in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | PBD-36793                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I see field "Program Name" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364029
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify when 'is active' is set as true then field displays in the modal.
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
    And I pause execution for "5" seconds
    Then I see field "Pre-Application Title" inside page block

  @364030 @364031
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify when 'is active' is set as False then field does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Grantor State Program Create | Name                      | {ConfigChecklist1:onModalAudits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I cannot see field "Audits" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364032
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify when 'is active' is set as False then field does not display in the modal.
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
    Then I do not see Required behavior under field "Title__c" with star mark on modal

  @364036 @364037 @364046 @364047 @lwcsanity @382286
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify help text displays after field label in the page block detail if provided in config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                                                         | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | This is a program abbreviation as determined by the internal organization | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                                                             | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Help Text Long | This is a program abbreviation as determined by the internal organization | Grantor State Program Create | Name                      | PBD-36954                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside modal "Abbreviation"
    Then I softly see "This is a program abbreviation as determined by the internal organization" shown as help text
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364038 @364048
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify help text displays after field label in the page block detail if provided in config.
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I pause execution for "10" seconds
    When I hovering mouse on help text icon inside modal "Type"
    Then I see "Type of Payment Request For eg Reimbursement or Advance etc" shown as help text

  @364039 @364041 @382302 @lwcsanity @382303
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify if Hide Select All Checkbox is true and alternate rendering is enable then select All option should be hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | true                       | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I do not see option "Select/Unselect All" is displayed inside "TypesOfAssistance__c" picklist field
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364042
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify if Hide Select All Checkbox is true and alternate rendering is enable then select All option should be hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | true                       | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
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
    Then I do not see option "Select/Unselect All" is displayed inside "INDIRECTBudgetCategories__c" picklist field

  @364123 @364124
  Scenario Outline: |LWC-Flex Edit layout- Modal- Page Block Detail- Admin/PM- To verify for multi select pick list feature, field name provided in the 'Alternative Rendering Config'|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see option "Select/Unselect All" is displayed inside "TypesOfAssistance__c" picklist field
    Then I softly see option "Display Value on UI 1" is displayed inside "TypesOfAssistance__c" picklist field
    Then I softly see option "Display Value on UI 2" is displayed inside "TypesOfAssistance__c" picklist field
    Then I softly see option "Display Value on UI 3" is displayed inside "TypesOfAssistance__c" picklist field
    Then I softly see option "Display Value on UI 4" is displayed inside "TypesOfAssistance__c" picklist field
    Then I softly see option "Display Value on UI 5" is displayed inside "TypesOfAssistance__c" picklist field
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364125
  Scenario:|LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify for multi select pick list feature, field name provided in the 'Alternative Rendering Config'|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
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
    Then I softly see option "Select/Unselect All" is displayed inside "INDIRECTBudgetCategories__c" picklist field
    Then I softly see option "Display Value on UI 1" is displayed inside "INDIRECTBudgetCategories__c" picklist field
    Then I softly see option "Display Value on UI 2" is displayed inside "INDIRECTBudgetCategories__c" picklist field
    Then I softly see option "Display Value on UI 3" is displayed inside "INDIRECTBudgetCategories__c" picklist field
    Then I softly see option "Display Value on UI 4" is displayed inside "INDIRECTBudgetCategories__c" picklist field
    Then I softly see option "Display Value on UI 5" is displayed inside "INDIRECTBudgetCategories__c" picklist field

  @364049 @364052 @382290 @lwcsanity @382291
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify if 'Read Only' is set as true for field in the details config then that will not be editable in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Audits__c" is not editable
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364054 @382292 @lwcsanity @reva
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify if 'Read Only' is set as true for field in the details config then that will not be editable in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | PaymentRequestAdvanceCreate | Name                      | PBD-42094                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | PaymentRequestAdvanceCreate | Name                      | PBD-42094                  |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I pause execution for "10" seconds
    Then I softly see field "CKEditorTest__c" is read-only field

  @364055 @364056
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify if 'Read Only' is set as false for field in the details config then that will not be editable in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | false         | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Audits__c" is editable
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364057 @rerundm
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify if 'Read Only' is set as false for field in the details config then that will not be editable in the modal.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Read Only | false         | PaymentRequestAdvanceCreate | Name                      | PBD-42094                  |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I pause execution for "5" seconds
    Then I softly do not see field "CKEditorTest__c" is read-only field


  @364058 @364059
  Scenario Outline:LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify 'Field Label Override' displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue     | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue         | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization | Grantor State Program Create | Name                      | PBD-36852                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see field "Internal Organization" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364061
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify 'Field Label Override' displays on UI.
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see field "Subaward" inside page block

  @364063 @364064 @reva
  Scenario Outline:LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify 'Field Label Override' displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                             | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                                      | Grantor State Program Create | Name                      | PBD-42152                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Automation Field Label Override Rich Text | Grantor State Program Create | Name                      | PBD-42152                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Automation Field Label Override Rich Text" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364066 @rerundm
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify 'Field Label Override (Rich Text)' displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             | Subaward          | PaymentRequestAdvanceCreate | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | PaymentRequestAdvanceCreate | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                     | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                              | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             | Automation testing PBD            | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Automation Automation testing PBD | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see field "Automation Automation testing PBD" inside page block

  @364067 @364068
  Scenario Outline:Master TC- LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify  if 'Hide Label' set as true then label of text field gets hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active  | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active  | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I cannot see field "Audits" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364069
  Scenario: Master TC- LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify  if 'Hide Label' set as true then label of text field gets hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active  | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active  | true          | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I cannot see field "Automation testing PBD" inside page block

  @364071 @364072
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify if 'Enable Rich Text Area Editor' is marked as true for Text Area/Long Text field then in the edit mode it will show as ck editor.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | true              | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Test_Description__c} |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Test_Description__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see ck editor displayed on pagelayout
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364074 @rerundm
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify if 'Enable Rich Text Area Editor' is marked as true for Text Area/Long Text field then in the edit mode it will show as ck editor.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | true          | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see ck editor displayed on pagelayout

  @364075 @364076
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Admin- To verify if 'Enable Rich Text Area Editor' is marked as false for Text Area/Long Text field then in the edit mode it will show as ck editor.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | false         | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I do not see ck editor displayed on pagelayout
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364077
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- SPI- To verify if 'Enable Rich Text Area Editor' is marked as False for Text Area/Long Text field then in the edit mode it will show as plain text field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField          | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | false             | PaymentRequestAdvanceCreate | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
      | Page Block Config:Page Block Rule Detail | Enable Rich Text Area Editor | false         | PaymentRequestAdvanceCreate | Name                      | {ConfigChecklist1:CKEditorTest__c} |
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I do not see ck editor displayed on pagelayout

  @364085 @364086
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- Admin- To verify sequence of columns in the lookup field displays the same as 'Lookup Display Field Names'
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                  | fieldOrignalValue                                | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesPBD37711 | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                  | fieldNewValue                                    | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesPBD37711 | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on "Primary Funding Organization" button
    Then I see column name "Organization Name" inside table at "1" sequence
    Then I see column name "EIN" inside table at "2" sequence
    Then I see column name "Organization Type" inside table at "3" sequence
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364087
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- SPI- To verify sequence of columns in the lookup field displays the same as 'Lookup Display Field Names'
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                  | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                  | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                  | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                  | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names |               | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    And I pause execution for "55" seconds
    And I click on "X_Contact" button
    Then I see column name "Full Name" inside table at "1" sequence
    Then I see column name "Organization Name" inside table at "2" sequence
    Then I see column name "Type" inside table at "3" sequence
    Then I see column name "Email" inside table at "4" sequence


  @364096 @364097
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- Admin- To verify records in the lookup fields should display as per 'Lookup Filter Criteria'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName              | fieldOrignalValue                                                         | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Lookup Filter Criteria | RecordType.Name IN ('Internal','External','NGO') AND Status__c = 'Active' | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName              | fieldNewValue                                                             | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Lookup Filter Criteria | RecordType.Name IN ('Internal','External','NGO') AND Status__c = 'Active' | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on "Primary Funding Organization" button
    And I see the text "NGO" in modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364099 @rerundm
  Scenario:LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- SPI- To verify records in the lookup fields should display as per 'Lookup Filter Criteria'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName              | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active              | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Lookup Filter Criteria |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName              | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active              | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Lookup Filter Criteria |               | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    And I click on "PrimaryContact__c" Lookup field
    And I see the text "Internal" in modal

  @364089 @364090
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- Admin- To verify if 'Lookup Sort Direction' is set as ASC then records should render in ascending  order.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                  | fieldOrignalValue                                | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesPBD37711 | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Lookup Sort By             |                                                  | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Lookup Sort Direction      |                                                  | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                  | fieldNewValue                                                | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesForSortOrderPBD37711 | Grantor State Program Create | Name                      | PBD-37711                  |
      | Page Block Config:Page Block Rule Detail | Lookup Sort By             | OrganizationName__c                                          | Grantor State Program Create | Name                      | PBD-37711                  |
      | Page Block Config:Page Block Rule Detail | Lookup Sort Direction      | ASC                                                          | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on "PrimaryFundingOrganization__c" Lookup field
    Then I see only the following ordered values in lookup field "PrimaryFundingOrganization__c" :
      | American Forest Foundation   |
      | Department of Config         |
      | Department of Framework      |
      | Department of Health         |
      | GMS Administrator            |
      | SYSTEM                       |
      | Test Automation Organization |
      | Test With Automation PM      |
    Examples:
      | Users |
      | PM    |

  @364092 @364093
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Lookup config- Admin/PM- To verify if 'Lookup Sort Direction' is set as DESC then records should render in ascending  order.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                  | fieldOrignalValue                                | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesPBD37711 | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Lookup Sort By             | OrganizationName__c                              | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Lookup Sort Direction      |                                                  | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                  | fieldNewValue                                                | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Lookup Display Field Names | govgrants_config:LookupDisplayFieldNamesForSortOrderPBD37711 | Grantor State Program Create | Name                      | PBD-37711                  |
      | Page Block Config:Page Block Rule Detail | Lookup Sort By             | OrganizationName__c                                          | Grantor State Program Create | Name                      | PBD-37711                  |
      | Page Block Config:Page Block Rule Detail | Lookup Sort Direction      | DESC                                                         | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on "Primary Funding Organization" button
    Then I see only the following ordered values in lookup field "PrimaryFundingOrganization__c" :
      | Test With Automation PM      |
      | Test Automation Organization |
      | SYSTEM                       |
      | GMS Administrator            |
      | Department of Health         |
      | Department of Framework      |
      | Department of Config         |
      | American Forest Foundation   |
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364104 @364105 @364115 @364117 @rerundm
  Scenario Outline:
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin/PM- To verify when user sets 'Required Behavior' as 'Required to save' then on UI if field is not filled then it throws validation message under the field and at top of the layout.|
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin- To verify when user sets 'Required Behavior' as 'Required to save' then on UI if field is not filled then it throws validation message at top of the layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    And I pause execution for "3" seconds
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter in modal value "" into field "ProgramName__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Overview tab under the Information section. |

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364106 @364118
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- SPI- To verify when user sets 'Required Behavior' as 'Required to save' then on UI if field is not filled then it throws validation message under the field and at top of the layout.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | PBD-37026                  |
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
    And I pause execution for "3" seconds
    And I enter in modal value "" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I see the following message in the page details contains:
      | To save, Pre-Application Title is required. |

  @364107 @364108 @364111 @364112 @382300 @lwcsanity
  Scenario Outline:
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin/PM- To verify when user sets 'Required Behavior' as 'Required to save' then on UI asterisk symbol should for that field.|
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin/PM- To verify when user sets 'Required Behavior' as 'Required to submit' then on UI exclamatory mark inside triangle that symbol should get display|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | PBD-37711                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    Then I see asterisk mark at "PrimaryFundingOrganization__c" field
    Then I see required for submit symbol as "Warning" at "Required to Submit" field
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364110 @364114
  Scenario:
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- SPI- To verify when user sets 'Required Behavior' as 'Required to save' then on UI asterisk symbol should for that field.|
  |LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin- To verify when user sets 'Required Behavior' as 'Required to submit' then on UI exclamatory mark inside triangle that symbol should get display|
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
    Then I see asterisk mark at "Title__c" field
    Then I see required for submit symbol as "Warning" at "Required to Submit" field

  @364119 @364121
  Scenario Outline: LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- Admin- To verify when user sets 'Required Behavior' as 'None' then no any symbol should display and record gets saved without filling that field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Grantor State Program Create | Name                      | PBD-36954                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    Then I do not see asterisk mark at "Abbreviation__c" field
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364122
  Scenario: LWC-Flex Edit layout- Modal- Page Block Detail- Required Config- SPI- To verify when user sets 'Required Behavior' as 'None' then no any symbol should display and record gets saved without filling that field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I do not see asterisk mark at "PrimaryContact__c" field

  @364128 @364130 @rerundm
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify Field gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | <Values>      | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I cannot see field "Audits" inside page block
    Examples:
      | Users | Values               |
      | Admin | System Administrator |
      | PM    | PM                   |

  @364137 @364138
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify Field gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Hide for User | Internal      | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I cannot see field "Audits" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364140
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify Field gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide for User |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Hide for User | Applicant     | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I cannot see field "PrimaryContact__c" inside page block

  @364141 @364142 @rerundm
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify Field should display Read only for the profile selected in 'Read only for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | <values>      | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I see field "Audits__c" is read-only field
    Examples:
      | Users | values          |
      | Admin | System Administrator |
#      | PM    | Program Manager |

  @364144 @wip
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify Field should display Read only for the profile selected in 'Read only for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | SPI           | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I see field "PrimaryContact__c" is read-only field

  @364145 @364146
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify Field should display Read only for the Context selected in 'Read only for Context'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Context |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For Context | Create        | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Audits__c" is not editable
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364148
  Scenario: LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify Field should display Read only for the Context selected in 'Read only for Context'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Context |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Read Only For Context | Create        | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I softly see field "PrimaryContact__c" is not editable

  @364149
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify Field should display Read only for the User selected in 'Read only for User'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Internal      | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Audits__c" is not editable
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364152 @364155 @364164 @rerundm
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify Field should display Read only for the User selected in 'Read only for User'.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Applicant     | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I softly see field "PrimaryContact__c" is not editable
    Then I see field "PrimaryContact__c" inside page block

  @364153 @364154
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Standard Field' Displays on UI.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I see field "Abbreviation" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364156 @364157 @364159 @364160 @364162 @364163 @364165 @364166
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify field with data type 'Text' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify field with data type 'Picklist' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify field with data type 'Lookup' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:AwardType__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Program Name" inside page block
    Then I softly see field "Primary Funding Organization" inside page block
    Then I softly see field "Award Type" inside page block
    Then I softly see field "Authorized Signatory" inside page block
    Then I softly see field "Abbreviation" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364161 @364167 @364171
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Picklist' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Number' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Date' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:PrimaryContact__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:FormulaVariable3__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:CreatedDate__c}      |
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
    Then I softly see field "PrimaryContact__c" inside page block
    Then I softly see field "FormulaVariable3__c" inside page block
    Then I softly see field "CreatedDate__c" inside page block

  @364152 @364155 @364164
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify Field should display Read only for the User selected in 'Read only for User'.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | PBD-42098                  |
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
    Then I softly see field "PrimaryContact__c" is not editable
    Then I see field "PrimaryContact__c" inside page block

  @364169 @364170 @364172 @364173
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify field with data type 'Date' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/PM- To verify field with data type 'Date and time' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:PublishedDate__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Date_And_Time__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "PublishedDate__c" inside page block
    Then I softly see field "Date_And_Time__c" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364174 @364181 @364184
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Date and time' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Formula' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Checkbox' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                  |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:ApplicationDeadline__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:PreApplicationPackage__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:RecordIncomplete__c}      |
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
    Then I softly see field "ApplicationDeadline__c" inside page block
    Then I softly see field "PreApplicationPackage__c" inside page block
    Then I softly see field "RecordIncomplete__c" inside page block

  @364175
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Percentage' Displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:PublishedDate__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Date_And_Time__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Published Date" inside page block
    Then I softly see field "Date_And_Time__c" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364178 @364180 @364182 @364183
  Scenario Outline:| LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/pm- To verify field with data type 'Formula' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin/pm- To verify field with data type 'Checkbox' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:AgencyAbbreviation__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:CFDA_Data__c}          |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "AgencyAbbreviation__c" inside page block
    Then I softly see field "CFDA_Data__c" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364185 @364186 @364188 @364190
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Email' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Currency' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Email_Test__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:ExpectedFunding__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Email_Test__c" inside page block
    Then I softly see field "ExpectedFunding__c" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364187 @364198
  Scenario:
  | LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Email' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Currency' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Long text area' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:Email_Address__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:RequestAssistanceAmount__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:TypeOfEducationProvided__c} |
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
    Then I softly see field "Email_Address__c" inside page block
    Then I softly see field "RequestAssistanceAmount__c" inside page block
    Then I softly see field "TypeOfEducationProvided__c" inside page block

  @364192 @364194 @364196 @364197
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'URL' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Long text area' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Audits" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364199 @364200 @364202 @364203 @382871 @382872 @LwcSmoke
  Scenario Outline:
  | LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Rich text area' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- Admin- To verify field with data type 'Picklist (Multi-Select)' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:Audits__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program Create | Name                      | {ConfigChecklist1:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    Then I softly see field "Audits__c" inside page block
    Then I softly see field "TypesOfAssistance__c" inside page block
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @364201 @364204 @382874 @Lwcsanity
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Rich text area' Displays on UI.|
  |LWC-Flex Edit Layout- Modal- Page Block Detail- SPI- To verify field with data type 'Multi-Picklist' Displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:TypeOfEducationHelp__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Create Grantor Preapplication | Name                      | {ConfigChecklist1:INDIRECTBudgetCategories__c} |
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
    Then I softly see field "TypeOfEducationHelp__c" inside page block
    Then I softly see field "INDIRECTBudgetCategories__c" inside page block

  @314566 @382244 @382245 @lwcsanity @rerundm
  Scenario Outline: LWC-Flex Edit Layout- Header- Admin/PM- To verify when edit action is configured then it should show on UI.
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I see "Edit" button is displayed
    Examples:
      | Users |
      | PM    |

  @314567 @314572 @314577 @314584 @382246 @lwcsanity @rerundm
  Scenario: |LWC-Flex Edit Layout- Header- SPI- To verify when edit action is configured then it should show on UI.|
  |LWC-Flex Edit Layout- Header- SPI- To verify when user clicks on edit action then edit context should get open.|
  |LWC-Flex Edit Layout- Header- SPI- To verify when edit context is opened then required fields should be editable|
  |LWC-Flex Edit Layout- Header- SPI- To verify in edit context available fields are filled and user clicks on save action then entered data should be saved.|
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And click on vertical Collapse button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    Then I see "Save" button is displayed
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    Then I see field "PurposeRTA__c" is editable

  @314569 @314575 @314582 @rerundm
  Scenario Outline: |LWC-Flex Edit Layout- Header- Admin/PM- To verify when user clicks on edit action then edit context should get open.|
  |LWC-Flex Edit Layout- Header- Admin/PM- To verify when edit context is opened then required fields should be editable|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click on modal button "Save"
    And I pause execution for "7" seconds
    When I click on modal button "Edit"
    Then I see field "ReviewComments__c" is editable
    Examples:
      | Users |
      | PM    |

  @314570 @314576 @314583 @314514 @rerundm
  Scenario Outline: |LWC-Flex Edit Layout- Header- Admin- To verify when user clicks on edit action then edit context should get open.|
  |LWC-Flex Edit Layout- Header- Admin- To verify when edit context is opened then required fields should be editable|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation ADMIN user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation ADMIN user"
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click on modal button "Save"
    And I pause execution for "7" seconds
    When I click on modal button "Edit"
    Then I see field "ReviewComments__c" is editable
    Examples:
      | Users |
      | Admin |

  @314613 @314614 @rerundm
  Scenario Outline: LWC-Flex Edit Layout- Header- Admin- To verify in edit context available fields are filled and user clicks on cancel action then entered data should not be saved.
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Responsibilities" sub tab
    And I pause execution for "4" seconds
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | No                   |
    #And I click on "Send for Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click on modal button "Close"
    Then I see field "ReviewComments__c" is not editable
    Examples:
      | Users |
      | PM    |

  @314616 @314617 @314619 @314620
  Scenario Outline:
  |LWC-Flex Edit Layout- Header- Admin/PM- To verify when label is override in 'Save Button Label' config then same label will be displayed on UI.|
  |LWC-Flex Edit Layout- Header- Admin- To verify when label is override in 'Cancel Button Label' config then same label will be displayed on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label   |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue               | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label   | Automation Save TC 314616   | ServiceAreaGrantor |                           |                            |
      | Page Layout:General   | Cancel Button Label | Automation Cancel TC 314616 | ServiceAreaGrantor |                           |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see "Automation Save TC 314616" button is displayed on top right of pagelayout
    Then I see "Automation Cancel TC 314616" button is displayed on top right of pagelayout
    Examples:
      | Users |
      | PM    |
      | Admin |

  @314618 @314621 @rerundm
  Scenario:
  |LWC-Flex Edit Layout- Header- SPI- To verify when label is override in 'Save Button Label' config then same label will be displayed on UI.|
  |LWC-Flex Edit Layout- Header- SPI- To verify when label is override in 'Cancel Button Label' config then same label will be displayed on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label   |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label   | Automation Save TC 314618   | Recipient Amendment |                           |                            |
      | Page Layout:General   | Cancel Button Label | Automation Cancel TC 314621 | Recipient Amendment |                           |                            |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    Then I see "Automation Save TC 314618" button is displayed
    Then I see "Automation Cancel TC 314621" button is displayed

  @314622 @314626 @314623 @314627
  Scenario Outline:
  |LWC-Flex Edit Layout- Header- Admin- To verify when no label is given in 'Save Button Label' config then standard label 'Save' will be displayed on UI.|
  |LWC-Flex Edit Layout- Header- Admin- To verify when no label is given in 'Cancel Button Label' config then standard label 'Cancel' will be displayed on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label   |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label   |               | ServiceAreaGrantor |                           |                            |
      | Page Layout:General   | Cancel Button Label |               | ServiceAreaGrantor |                           |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see "Save" button is displayed on top right of pagelayout
    Then I see "Cancel" button is displayed on top right of pagelayout
    Examples:
      | Users |
      | PM    |
      | Admin |

  @314632 @rerundm
  Scenario Outline: LWC-Flex Edit Layout- Header- Admin- To verify when Highlights Panel is unchecked then header overview should be hidden
    Given I have "default" configuration as below:
      | configurationCategory               | fieldName         | fieldOrignalValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | false             | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | false         | ServiceAreaGrantor | Name                      | TAB-4635                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly can see "Overview" sub tab at view detail page

    Examples:
      | Users |
      | PM    |

  @314624 @314628 @rerundm
  Scenario:
  |LWC-Flex Edit Layout- Header- SPI- To verify when no label is given in 'Save Button Label' config then standard label 'Save' will be displayed on UI.|
  |LWC-Flex Edit Layout- Header- SPI- To verify when no label is given in 'Cancel Button Label' config then standard label 'Cancel' will be displayed on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label   |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label   |               | Recipient Amendment |                           |                            |
      | Page Layout:General   | Cancel Button Label |               | Recipient Amendment |                           |                            |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see "Save" button is displayed
    Then I see "Cancel" button is displayed

  @314634 @rerundm
  Scenario: LWC-Flex Edit Layout- Header- SPI- To verify when Highlights Panel is unchecked then header overview should be hidden
    Given I have "default" configuration as below:
      | configurationCategory               | fieldName         | fieldOrignalValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | true              | Recipient Amendment | Name                      | TAB-4597                   |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Highlights Panel? | false         | Recipient Amendment | Name                      | TAB-4597                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I do not see complete header overview tab is displayed at view detail page

  @363695
  Scenario Outline: |Master TC- LWC-Flex Edit Layout- Modal- Page Tab- Admin/pm- To verify Tab title displays as expected which is provided in the config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Tab Title | Overview          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | ServiceArea Create | Name                      | TAB-4458                   |
      | Page Tabs Config:Page Layout Action | Tab Title | Overview      | ServiceArea Create | Name                      | TAB-4458                   |
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see "Overview" Tab title displays on modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363698 @363701
  Scenario: Master TC- LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify Tab title displays as expected which is provided in the config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Tab Title | Overview          | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title | Overview      | Create Grantor Preapplication | Name                      | TAB-4286                   |
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
    Then I see "Overview" Tab title displays on modal

  @363699 @363702 @36370
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Tab- Admin/pm- To verify when user changes the sort order of the page tab in config then it displays the same on UI in modal.|
  |LWC-Flex Edit Layout- Modal- Page Tab- Admin/pm- To verify when 'is active' is set as true then tab displays in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Sort Order       | 10                | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide for Context | Create            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Sort Order       | 10            | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Hide for Context |               | ServiceArea Create | Name                      | TAB-4511                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see "Overview" tab displayed sequence "1" on modal
    Then I see "Attachments" tab displayed sequence "2" on modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363705 @363706
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Tab- Admin/PM- To verify when 'is active' is set as False then tab does not display in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Tab Title | Automation Tab    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | false         | ServiceArea Create | Name                      | TAB-4511                   |
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I do not see "Overview" subtab is present in page details

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363710 @363712 @363340 @363341 @382256 @lwcsanity
  Scenario Outline:
  |LWC-Flex Edit Layout- Modal- Page Tab- Admin/PM- To verify Tab icon is visible on UI if css is given in the config.|
  |LWC-Flex Edit Layout- Modal- Page Tab- Admin/PM- To verify Header Instruction Text displays in the modal if provided in the config.|
  |LWC-Flex Edit Layout-Modal- Admin/PM- To verify when user gives 'Header instructions' in config for page tab, it displays on UI.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context        | Create            | ApiGeneratedId:1 |
      | Page Tabs Config      | Tab Title               | Attachments       | ApiGeneratedId:2 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active               | true                               | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Hide for Context        |                                    | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Tab Title               | Attachments                        | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Automation Header Instruction Text | ServiceArea Create | Name                      | TAB-4511                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I pause execution for "5" seconds
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Automation Header Instruction Text" shown as header instruction text
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363343
  Scenario: LWC-Flex Edit Layout-Modal- SPI- To verify when user gives 'Header instructions' in config for page layout, it displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Tab Title               | Overview          | ApiGeneratedId:0 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                      | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title               | Overview                           | Create Grantor Preapplication | Name                      | TAB-4286                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Automation Header Instruction Text | Create Grantor Preapplication | Name                      | TAB-4286                   |
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
    Then I see "Automation Header Instruction Text" shown as header instruction text

  @363719 @363720 @382259 @lwcsanity
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Tab- Admin/pm- To verify page tab gets hide for the Context selected in 'Hide for Context'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context | Create            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | Create        | ServiceArea Create | Name                      | TAB-4511                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I do not see "Attachments" Tab title displays on modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363723
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Tab- Admin- To verify page tab gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Tab Title        | Attachments       | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide for Context | Create            | ApiGeneratedId:2 |
      | Page Tabs Config      | Hide for User    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Tab Title        | Attachments   | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Hide for Context |               | ServiceArea Create | Name                      | TAB-4511                   |
      | Page Tabs Config:Page Layout Action | Hide for User    | Internal      | ServiceArea Create | Name                      | TAB-4511                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I do not see "Attachments" Tab title displays on modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363704 @363715
  Scenario:
  |LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify when 'is active' is set as true then tab displays in the modal.|
  |LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify Tab icon is visible on UI if css is given in the config.|
  |LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify Header Instruction Text displays in the modal if provided in the config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Tab Title               | Overview          | ApiGeneratedId:0 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                      | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title               | Overview                           | Create Grantor Preapplication | Name                      | TAB-4286                   |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | Automation Header Instruction Text | Create Grantor Preapplication | Name                      | TAB-4286                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "30" seconds
    And I click on "Create Pre-Application" in the page details
    Then I see "Overview" Tab title displays on modal
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    Then I see "Automation Header Instruction Text" shown as header instruction text

  @363718
  Scenario: |LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify page tab gets hide for the profile selected in 'Hide for Context'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Tabs Config      | Is Active        | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Create Grantor Preapplication | Name                      | TAB-4819                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | Create        | Create Grantor Preapplication | Name                      | TAB-4819                   |
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
    And I pause execution for "3" seconds
    Then I do not see "Automation Tab" Tab title displays on pagelayout

  @363721 @382260 @lwcsanity
  Scenario: LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify page tab gets hide for the Context selected in 'Hide for Context'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Tabs Config      | Is Active        | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Create Grantor Preapplication | Name                      | TAB-4819                   |
      | Page Tabs Config:Page Layout Action | Hide for Context | Create        | Create Grantor Preapplication | Name                      | TAB-4819                   |
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
    And I pause execution for "3" seconds
    Then I do not see "Automation Tab" Tab title displays on pagelayout

  @363726 @382262 @lwcsanity
  Scenario: LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify page tab gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Tabs Config      | Is Active        | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide for Profile |                   | Create Grantor Preapplication | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Create Grantor Preapplication | Name                      | TAB-4819                   |
      | Page Tabs Config:Page Layout Action | Hide for Context |               | Create Grantor Preapplication | Name                      | TAB-4819                   |
      | Page Tabs Config:Page Layout Action | Hide for Profile | SPI           | Create Grantor Preapplication | Name                      | TAB-4819                   |
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
    Then I do not see "Automation Tab" Tab title displays on pagelayout

  @363707
  Scenario: LWC-Flex Edit Layout- Modal- Page Tab- SPI- To verify when 'is active' is set as False then tab does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Tab Title | Overview          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Tab Title | Overview      | Grantor Application Create | Name                      | TAB-4206                   |
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
    Then I see "Overview" Tab title displays on modal

    ##########Modal Edit layout -Layout config (Suite ID: 363256)#############

  @363317 @363321 @363320 @363324
  Scenario Outline:
  |Master TC- LWC-Flex Edit Layout-Modal- Admin/pm- To verify on click of top level action of any table then modal gets open if 'Where to Open?' behavior is modal|
  |LWC-Flex Edit Layout-Modal- Admin/pm- To verify Modal Title is displayed on UI which given in the config of top level action of table.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Width     |                   | GrantorServiceAreas | Name                      | New                        |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal                        | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL                      | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Automation Create Focus Area | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Width     | 50                           | GrantorServiceAreas | Name                      | New                        |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see "Automation Create Focus Area" opens in overLay window
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363322 @363325 @363336
  Scenario:
  |Master TC- LWC-Flex Edit Layout-Modal- SPI- To verify on click of top level action of any table then modal gets open if 'Where to Open?' behavior is modal|
  |LWC-Flex Edit Layout-Modal- SPI- To verify Modal Title is displayed on UI which given in the config of top level action of table.|
  |LWC-Flex Edit Layout-Modal- SPI- To verify in edit modal on save action is present.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal                        | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
      | Flex Table Action     | Modal Title     | Create Reimbursement Request | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue                | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal                        | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
      | Flex Table Action     | Modal Title     | Create Reimbursement Request | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see "Create Reimbursement Request" opens in overLay window
    Then I see "Save and Continue" at bottom of Attachment Modal

  @363326 @363330 @rerundm
  Scenario Outline: |LWC-Flex Edit Layout-Modal- Admin/PM- To verify when user changes modal width in config of top level action then modal opens in the width.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Width     |                   | GrantorServiceAreas | Name                      | New                        |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal                        | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL                      | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Automation Create Focus Area | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Width     | 50                           | GrantorServiceAreas | Name                      | New                        |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see modal window is open in same tab with style "width: 1000"
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363331 @rerundm
  Scenario: |LWC-Flex Edit Layout-Modal- SPI- To verify when user changes modal width in config of top level action then modal opens in the width.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
      | Flex Table Action     | Modal Width     |                   | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal         | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
      | Flex Table Action     | Modal Width     | 1000          | RecipientsAwardPaymentRequests | Name                      | Reimbursement Request      |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see modal window is open in same tab with style "width: 1000"

  @363333
  Scenario Outline: LWC-Flex Edit Layout-Modal- Admin- To verify in edit modal on save action is present.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see "Save and Continue" at bottom of Attachment Modal
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363345 @363346 @rerundm
  Scenario Outline:LWC-Flex Edit Layout-Modal- Admin- To verify when user gives 'Header instructions' in config for page layout, it displays on UI.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Action Behavior | OpenURL           | GrantorServiceAreas | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Focus Area | GrantorServiceAreas | Name                      | New                        |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I see "Save and Continue" at bottom of Attachment Modal
    Then I see field message with text as "Required to Save" and "Required to Submit"
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363347 @382239 @smoke
  Scenario: LWC-Flex Edit Layout-Modal- SPI- To verify required to save and required to submit message displays on edit modal.
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "AdditionalAddress"
    Then I see field message with text as "Required to Save" and "Required to Submit"

  @363349 @399038 @399037 @lwcsanity @382243
  Scenario Outline: LWC-Flex Edit Layout-Modal- PM-To verify on click of save action if mandatory fields are not filled then it should throw validation message.
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Information section. |
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363350 @rerundm
  Scenario: LWC-Flex Edit Layout-Modal- SPI-To verify on click of save action if mandatory fields are not filled then it should throw validation message.
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "AdditionalAddress"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Address Type is required. |

  @363351 @363353
  Scenario Outline: LWC-Flex Edit Layout-Modal-  Admin/PM - To verify in page layout config of edit modal if 'Close Modal On Save' is set as true then modal gets closed on click on save action.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Close Modal On Save | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Close Modal On Save | true          | New Contact        |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I see "Create Contact" opens in overLay window
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @363355
  Scenario Outline: LWC-Flex Edit Layout-Modal-  PM- To verify in page layout config of edit modal if 'Close Modal On Save' is set as False then modal manually needs to close.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Page Layout           | Close Modal On Save | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Close Modal On Save | false         | New Contact        |                           |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I pause execution for "10" seconds
    Then I see "Create Contact" opens in overLay window
    Examples:
      | Users |
#      | Admin |
      | PM    |