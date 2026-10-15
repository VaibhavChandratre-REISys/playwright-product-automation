@ComponentSanity @ModalComponentSanity @ComponentSanity2 @ComponentSanity2_1

Feature: Component Sanity Testing we have covered different modal behaviours,
  such as where to open the action URL and how the data fields are rendered.

  @549495 @549499
  Scenario Outline: LWC - Modal - Admin - To verify that Modal should get open properly
  |LWC - Modal - PM - To verify that Modal should get open properly |
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
    Then I softly see "Create Strategic Plan" opens in overLay window
    Then I see "Information" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @549514 @549515 @549565
  Scenario Outline: LWC - Modal - Admin - To verify that page redirect behavior should work properly
  |LWC - Modal - PM - To verify that page redirect behavior should work properly |
  |LWC - Modal - PM - To verify that confirmation message should display on clicking close action/sign|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "Save" button is displayed
    Then I softly see "Cancel" button is displayed
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @549540 @549565
  Scenario Outline: LWC - Modal - Admin - To verify that confirmation message should display on clicking close action/sign
  |LWC - Modal - PM - To verify that confirmation message should display on clicking close action/sign|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "5" seconds
    When I close "Create Program" modal by clicking the top right x button without processing
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "You have unsaved changes. Do you want to discard them?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @549621 @549622
  Scenario Outline: LWC - Modal - Admin - To verify Modal Title is displayed on Modal which given in the config of top level action of table.
  |LWC - Modal - PM - To verify Modal Title is displayed on Modal which given in the config of top level action of table.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal             | Programs           | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Program    | Programs           | Name                      | New                        |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ? | Modal          | Programs           | Name                      | New                        |
      | Flex Table Action     | Modal Title     | Create Program | Programs           | Name                      | New                        |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I see "Create Program" opens in overLay window
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @549628 @549649
  Scenario: LWC - Modal - Admin - Page Block Detail - To verify all type of data type fields are getting rendered in the page block details.
  |LWC - Modal - PM - Page Block Detail - To verify all type of data type fields are getting rendered in the page block details.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "ProgramName__c" inside page block detail
    Then I softly see "Abbreviation__c" inside page block detail
    Then I softly see "Type__c" inside page block detail
    Then I softly see "Account__c" inside page block detail
    Then I softly see "WebsiteAddress__c" inside page block detail
    Then I softly see "FocusAreaRequired__c" inside page block detail
    Then I softly see "IsGoalsRequired__c" inside page block detail
    Then I softly see "KPIsRequired__c" inside page block detail

  @549656 @549707 @549708
  Scenario Outline: LWC - Modal - PM - Page Block Detail - To verify page block detail gets hide when hide logic is applied
  |LWC - Modal - Admin - Page Block Detail - To verify page block detail gets hide when hide expression jsons is applied|
  |LWC - Modal - PM - Page Block Detail - To verify page block detail gets hide when hide expression jsons is applied|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                               | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                        | Grantor State Program Create | Name                      | {SavedValue:Audits__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForPmProfileProgram__c | Grantor State Program Create | Name                      | {SavedValue:Audits__c}     |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see "Audits__c" inside page block detail
    #Then I see field "Audits__c" is not editable
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @549676 @549674
  Scenario: LWC - Modal - PM - To verify user is able to add table in the modal
  |LWC - Modal - Admin - To verify user is able to add table in the modal|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I see table id "---program:-:associateContactsTableId---" flex table render in modal view

  @549679 @549684 @5496791
  Scenario: LWC - Modal - Admin - Page Block Detail - To verify 'Required to save' fields on modal
  |LWC - Modal - PM - Page Block Detail - To verify 'Required to save' fields on modal|
  |LWC - Modal - Admin - Page Block Detail - To verify 'Required to save' fields on modal|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Program Name is required to save. Enter it in the Information section.                        |
      | Type is required to save. Enter it in the Information section.                                |
      | Primary Funding Organization is required to save. Enter it in the Information section.        |
      | Focus Areas Required? is required to save. Enter it in the Program Specific Settings section. |
      | Objectives Required? is required to save. Enter it in the Program Specific Settings section.  |


  @549710 @549711 @549713 @549714 @549652
  Scenario Outline:LWC - Modal - Admin - Page Block - To verify page block gets hide when hide logic is applied
  |LWC - Modal - PM - Page Block - To verify page block gets hide when hide logic is applied|
  |LWC - Modal - Admin - Page Block - To verify page block gets hide when hide expression json is applied|
  |LWC - Modal - PM - Page Block - To verify page block gets hide when hide expression json is applied|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                               | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail | Is Active            | true                                        | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HideForPmProfileProgram__c | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I cannot see field "Test Block" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @549623
  Scenario: LWC - Modal - SPI - To verify Modal Title is displayed on Modal which given in the config of top level action of table.
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I see "Create Reimbursement Request" opens in overLay window
    Then I see "Save and Continue" at bottom of Attachment Modal

  @549624 @549625
  Scenario: LWC - Modal - SPI - To verify that confirmation message should display on clicking close action/sign
  |LWC - Modal - SPI - To verify that Modal should get open properly |
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "2" seconds
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Title is required. |
    When I close "Create Reimbursement Request" modal by clicking the top right x button without processing
    Then I softly see confirmation box with body "You have unsaved changes. Do you want to discard them?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @549626
  Scenario: LWC - Modal - SPI - To verify that page redirect behavior should work properly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I wait for "2" seconds
    Then I see "Qualify" button is displayed

  @549650
  Scenario: LWC - Modal - SPI - Page Block Detail - To verify all type of data type fields are getting rendered in the page block details.
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "2" seconds
    Then I softly see "Title__c" inside page block detail
    Then I softly see "BillingStartDate__c" inside page block detail
    Then I softly see "BillingEndDate__c" inside page block detail
    Then I softly see "IsFinalPR__c" inside page block detail
    Then I softly see "Type__c" inside page block detail
    Then I softly see "Award__c" inside page block detail


  @549677
  Scenario:LWC - Modal - SPI - To verify user is able to add table in the modal
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    Then I see table id "---amendment:-:RecipientKeyPersonalAssociateTableId---" flex table render in modal view

  @549657 @549712 @549715
  Scenario: LWC - Modal - SPI - Page Block Detail - To verify page block detail gets hide when hide logic is applied
  |LWC - Modal - SPI - Page Block - To verify page block gets hide when hide logic is applied|
  |LWC - Modal - SPI - Page Block - To verify page block gets hide when hide expression json is applied|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block                               | Is Active            | false             | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
      | Page Block                               | Hide Expression JSON |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:1 |

    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block:Page Block Detail             | Is Active            | true                                                | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference}   |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HideForSpiProfilePaymentRequest__c | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | PaymentRequestReimbursementCreate | Name                      | {SavedValue:RecallComment__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForSpiProfilePaymentRequest__c | PaymentRequestReimbursementCreate | Name                      | {SavedValue:RecallComment__c} |
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "2" seconds
    Then I cannot see field "Award Reference" inside page block
    Then I softly cannot see field "X_Recall Comment" inside page block


  @549685
  Scenario: LWC - Modal - SPI - Page Block Detail - To verify 'Required to save' fields on modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block            | Is Active            | false             | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail | Is Active            | true                                                | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference} |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HideForSpiProfilePaymentRequest__c | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference} |
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Title is required. |

  @549709
  Scenario: LWC - Modal - SPI - Page Block Detail - To verify page block detail gets hide when hide expression jsons is applied
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block                               | Is Active            | false             | PaymentRequestReimbursementCreate | ApiGeneratedId:0 |
      | Page Block                               | Hide Expression JSON |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | PaymentRequestReimbursementCreate | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference} |
      | Page Block:Page Block Detail             | Hide Expression JSON |                                                     | PaymentRequestReimbursementCreate | Name                      | {SavedValue:AwardReference} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForSpiProfilePaymentRequest__c | PaymentRequestReimbursementCreate | Name                      | {SavedValue:Approver4__c}   |
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
    And I get current URL
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I wait for "2" seconds
    Then I softly do not see "Approver4__c" inside page block detail
