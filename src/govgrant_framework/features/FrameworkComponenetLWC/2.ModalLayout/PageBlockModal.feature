@lwcPageBlock @neetaPagelayoutLWC @modal
Feature: Page Block Scenarios for Page Edit/View Modal

  @363792 @363793  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify when 'is active' is set as true then page block displays in the modal.
  | LWC-Flex Edit Layout- Modal- Page Block- PM- To verify when 'is active' is set as true then page block displays in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active | true              | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I see "Information" page block displayed
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363794 @363796  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify when 'is active' is set as False then page block does not display in the modal.
  | LWC-Flex Edit Layout- Modal- Page Block- PM- To verify when 'is active' is set as False then page block does not display in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active | true              | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I cannot see field "Information" inside page block
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363798 @363799  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify Page Block Title displays the same on UI which is updated in config.
  | LWC-Flex Edit Layout- Modal- Page Block- PM- To verify Page Block Title displays the same on UI which is updated in config.  |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Page Block Title | Information       | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Page Block Title | Information1  | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I see "Information1" page block displayed
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363817 @363818  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify Header Instruction Text displays in the modal if provided in the config.
  | LWC-Flex Edit Layout- Modal- Page Block- PM- To verify Header Instruction Text displays in the modal if provided in the config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Header Instruction Text |                   | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Create Strategic Plan | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I see "Create Strategic Plan" page block displayed
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363822 @363818  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- PM- To verify help text displays after field label in the page block if provided in config.
  | LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify help text displays after field label in the page block if provided in config.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                                                                     | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Type of grant programs (Project, Research, Formula, Block, Earmark, Emergency, Other) | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                                                                          | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Type of grant programs1 (Project, Research, Formula, Block, Earmark, Emergency, Other) | Grantor State Program Create | Name                      | PBD-36951                  |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside modal "Type"
    Then I softly see "Type of grant programs1 (Project, Research, Formula, Block, Earmark, Emergency, Other)" shown as help text
    Examples:
      | User  |
      | ADMIN |

  @363826  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Hide For Profile |                   | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | System Administrator | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I cannot see field "Information" inside page block

  @363827  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- PM- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Hide For Profile |                   | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | PM            | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I cannot see field "Information" inside page block

  @363833 @363834  @Sprint12
  Scenario Outline: LWC-Flex Edit Layout- Modal- Page Block- Admin- To verify page Block gets hide for the User selected in 'Hide for User'.
  | LWC-Flex Edit Layout- Modal- Page Block- PM- To verify page Block gets hide for the User selected in 'Hide for User'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Hide For User |                   | Strategic Plan Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Internal      | Strategic Plan Create | Name                      | PB-12258                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I cannot see field "Information" inside page block
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363795  @Sprint12
  Scenario: Master TC- LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify when 'is active' is set as true then page block displays in the modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Is Active | true              | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I see "General Information" page block displayed

  @363797  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify when 'is active' is set as False then page block does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Is Active | true              | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I cannot see field "General Information" inside page block

  @363800  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify Page Block Title displays the same on UI which is updated in config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | coreComponentField                | filterId         |
      | Page Block            | Page Block Title | General Information | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Page Block Title | General Information1 | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I see "General Information1" page block displayed

  @363819  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify Header Instruction Text displays in the modal if provided in the config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Header Instruction Text |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Create Request | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I see "Create Request" page block displayed

  @363828  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Hide For Profile |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | SPI           | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I cannot see field "General Information" inside page block

  @363835  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify page Block gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Hide For User |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Applicant     | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I cannot see field "General Information" inside page block

  @363825  @Sprint12
  Scenario: LWC-Flex Edit Layout- Modal- Page Block- SPI- To verify help text displays after field label in the page block if provided in config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue                                           | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Type of Payment Request For eg Reimbursement or Advance etc | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Type of Payment Request For eg Reimbursement or Advance etc1 | PaymentRequestReimbursementCreate | Name                      | PBD-38460                  |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside modal "Type"
    Then I softly see "Type of Payment Request For eg Reimbursement or Advance etc1" shown as help text

  @363741 @363837  @Sprint
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- PM- To verify when 'is active' is set as true then page block displays in the modal.
  | LWC-Flex View Layout- Modal- Page Block- Admin- To verify when 'is active' is set as true then page block displays in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I see "Information" page block displayed
    Examples:
      | User  |
      | ADMIN |

  @363839 @363840  @Sprint12
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- Admin- To verify when 'is active' is set as False then page block does not display in the modal.
  | LWC-Flex View Layout- Modal- Page Block- PM- To verify when 'is active' is set as False then page block does not display in the modal.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I cannot see field "Information" inside page block
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363842 @363843  @Sprint12
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- Admin- To verify Page Block Title displays the same on UI which is updated in config.
  | LWC-Flex View Layout- Modal- Page Block- PM- To verify Page Block Title displays the same on UI which is updated in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Page Block Title | Information       | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Page Block Title | Information1  | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I see "Information1" page block displayed
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363860 @363861  @Sprint12
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- Admin- To verify Header Instruction Text displays in the modal if provided in the config.
  | LWC-Flex View Layout- Modal- Page Block- PM- To verify Header Instruction Text displays in the modal if provided in the config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Package Preview Info | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I see "Package Preview Info" page block displayed
    Examples:
      | User  |
#      | ADMIN |
      | PM    |

  @363863 @363864  @Sprint12
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- Admin- To verify help text displays after field label in the page block if provided in config.
  | LWC-Flex View Layout- Modal- Page Block- PM- To verify help text displays after field label in the page block if provided in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Help Text |                   | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Help Text | Info Details  | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside modal "Information"
    Then I softly see "Info Details" shown as help text
    Examples:
      | User  |
      | ADMIN |

  @363866  @Sprint12
  Scenario: LWC-Flex View Layout- Modal- Page Block- Admin- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Profile |                   | PackagePreview     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | System Administrator | PackagePreview     | Name                      | PB-10902                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Preview" icon for "Grantor Payment Request Forms" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I cannot see field "Information" inside page block

  @363873  @Sprint12 @R
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- PM- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active        | true              | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block            | Hide For User    |                   | ServiceArea Create | ApiGeneratedId:1 |
      | Page Block            | Hide for Context | Create            | ServiceArea Create | ApiGeneratedId:2 |
      | Page Block            | Hide For Profile |                   | ServiceArea Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active        | true          | ServiceArea Create | Name                      | PB-12783                   |
      | Page Block:Page Block Detail | Hide For User    |               | ServiceArea Create | Name                      | PB-12783                   |
      | Page Block:Page Block Detail | Hide for Context |               | ServiceArea Create | Name                      | PB-12783                   |
      | Page Block:Page Block Detail | Hide For Profile | PM            | ServiceArea Create | Name                      | PB-12783                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I cannot see field "System Information" inside page block
    Examples:
      | Users |
      | PM   |

  @363870 @363871  @Sprint12
  Scenario Outline: LWC-Flex View Layout- Modal- Page Block- Admin- To verify page Block gets hide for the User selected in 'Hide for User'.
  | LWC-Flex View Layout- Modal- Page Block- PM- To verify page Block gets hide for the User selected in 'Hide for User'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active        | true              | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block            | Hide For User    |                   | ServiceArea Create | ApiGeneratedId:0 |
      | Page Block            | Hide for Context | Create            | ServiceArea Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active        | true          | ServiceArea Create | Name                      | PB-12783                   |
      | Page Block:Page Block Detail | Hide For User    | Internal      | ServiceArea Create | Name                      | PB-12783                   |
      | Page Block:Page Block Detail | Hide for Context |               | ServiceArea Create | Name                      | PB-12783                   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Then I cannot see field "System Information" inside page block
    Examples:
      | Users  |
      | PM    |
#      | ADMIN |

  @363838  @Sprint12 @379439 @LwcSmoke
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify when 'is active' is set as true then page block displays in the modal.
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
    Then I see "Information" page block displayed

  @363841 @Sprint12
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify when 'is active' is set as False then page block does not display in the modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Is Active | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | false         | Create Grantor Preapplication | Name                      | {ConfigChecklist1:AutomationPageBlock} |
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
    Then I cannot see field "AutomationPageBlock" inside page block

  @363844  @Sprint12
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify Page Block Title displays the same on UI which is updated in config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Page Block Title | Information       | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Page Block Title | Information   | Create Grantor Preapplication | Name                      | PB-11789                   |
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
    Then I see "Information" page block displayed

  @363862  @Sprint12
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify Header Instruction Text displays in the modal if provided in the config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block            | Header Instruction Text |                   | Create Grantor Preapplication | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                    | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Header Instruction Text displays | Create Grantor Preapplication | Name                      | PB-11789                   |
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
    Then I see "Header Instruction Text displays" page block displayed

  @363865  @Sprint12 @R
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify help text displays after field label in the page block if provided in config.
#    Given I have "default" configuration as below:
#      | configurationCategory                    | fieldName      | fieldOrignalValue | coreComponentField            | filterId         |
#      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | Create Grantor Preapplication | ApiGeneratedId:0 |
#    Given I setup test configuration as below:
#      | configurationCategory                    | fieldName      | fieldNewValue  | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Page Block Config:Page Block Rule Detail | Help Text Long | Help text test | Create Grantor Preapplication | Name                      | PB-11789                   |
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
    When I hovering mouse on help text icon inside modal "Information"
    Then I softly see "Help text test" shown as help text

  @363874 @Sprint12 @382280
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify page Block gets hide for the profile selected in 'Hide for Profile'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Hide For Profile |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | SPI           | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I cannot see field "General Information" inside page block

  @363872 @Sprint12
  Scenario: LWC-Flex View Layout- Modal- Page Block- SPI- To verify page Block gets hide for the User selected in 'Hide for User'.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Hide For User |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Applicant     | PaymentRequestReimbursementCreate | Name                      | PB-12491                   |
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "3" seconds
    Then I cannot see field "General Information" inside page block