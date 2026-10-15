@ComponentSanity @multiselectpicklist @ComponentSanity2 @ComponentSanity2_1
Feature: Component Sanity Testing 1. MultiSelectPickList
  In this feature file, we use the following tags for component-wise execution:MultiSelectPickList

  @506255 @506257 @506258 @multiselectpicklist
  Scenario Outline: 3.0- Modal- Multi-Select picklist- Admin/PM- To verify that selecting Multiple option under Multi-Select Picklist
  |3.0- Modal- Multi-Select picklist- Admin/PM- To verify Field Label Override Config should work for MS field|
  |3.0- Modal- Multi-Select picklist- Admin/PM- To verify Sort Order config should work for MS Field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Automation Field Label Override | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I see field "Automation Field Label Override" inside page block
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    Examples:
      | Users |
      | PM    |

  @506259 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- Admin/PM-  To verify Hide Logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                                                     | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionBuilderPBDUserTypeIn | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    Then I cannot see field "Types Of Assistance" inside page block

  @506261 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- Admin/PM- To verify that Field Label Override (Rich Text) is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program Create | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                 | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text Types Of Assistance | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                         | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    Then I see field "Rich Text Types Of Assistance" inside page block


  @506263 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- Admin/PM- To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active  | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Grantor State Program Create | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active  | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    Then I cannot see field label "Types Of Assistance" inside page block
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |

  @506265 @506267 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- Admin/PM- To verify that Read only logic is working after render on config
  |3.0- Modal- Multi-Select picklist- Admin/PM- To verify Help Text on Hovering Help Text Icon Functioning correctly |
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Grantor State Program Create | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                  | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                                | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation Types Of Assistance | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "3" seconds
    Then I softly see field "TypesOfAssistance__c" is read-only field
    When I hovering mouse on help text icon inside modal "Types Of Assistance"
    Then I softly see "Automation Types Of Assistance" shown as help text

  @508146 @508152 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- SPI- To verify that selecting Multiple option under Multi-Select Picklist
  |3.0- Modal- Multi-Select picklist- SPI- To verify Field Label Override after render in Config|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor Contact    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Automation Field Label Override | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I see field "Automation Field Label Override" inside page block
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |

  @508155 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist- SPI-  To verify Hide Logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false               | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                     | Grantor Contact    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance                                            | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForMultiSelectPicklistOncontact | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "5" seconds
    Then I cannot see field "Types Of Assistance" inside page block

  @508157 @multiselectpicklist
  Scenario:3.0- Modal- Multi-Select picklist- SPI- To verify that Field Label Override (Rich Text) is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false               | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             | Types Of Assistance | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                     | Grantor Contact    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                          | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                               | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text Types Of Assistance | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "5" seconds
    Then I see field "Rich Text Types Of Assistance" inside page block

  @508167 @multiselectpicklist
  Scenario:3.0- Modal- Multi-Select picklist- SPI- To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false               | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false               | Grantor Contact    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true                | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "5" seconds
    Then I cannot see field label "Types Of Assistance" inside page block

  @508168 @multiselectpicklist
  Scenario: 3.0- Modal- Multi-Select picklist-  SPI- To verify that Read only is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false               | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false               | Grantor Contact    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Types Of Assistance | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "5" seconds
    Then I softly see field "TypesOfAssistance__c" is read-only field

##########layout multi select picklist########
  @504634 @550035 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist- Admin/PM- To verify that selecting Multiple option under Multi-Select Picklist
  |3.0- Page Layout- Multi-Select picklist- Admin/PM-Verify that Multi select picklist should be visible on page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |

  @504640 @multiselectpicklist
  Scenario Outline: 3.0- Page Layout- Multi-Select picklist- Admin/PM-  To verify Hide Logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
#      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                 | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
#      | Page Block Config:Page Block Rule Detail | Is Active                 | false                                                | Grantor State Program | Name                      | {pagelayout:CreateProgramPageLayoutTypesOfAssistance__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:hideExpressionBuilderPBDContextEdit | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                      | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Types Of Assistance" inside page block
    Examples:
      | Users |
      | PM    |

  @504642 @multiselectpicklist
  Scenario Outline: 3.0- Page Layout- Multi-Select picklist- Admin/PM- To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:0 |
#      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label                | false             | Grantor State Program | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
#      | Page Block Config:Page Block Rule Detail | Is Active                 | false         | Grantor State Program | Name                      | {pagelayout:CreateProgramModalTypesOfType__C}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly cannot see field label "Types Of Assistance" inside page block
    Examples:
      | Users |
      | PM    |

  @507503 @550037 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist- SPI- To verify that selecting Multiple option under Multi-Select Picklist
  |3.0- Page Layout- Multi-Select picklist- SPI-Verify that Multi select picklist should be visible on page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I see field "Application Sections for Revision" inside page block
    When I enter "ApplicationSectionsForRevision" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Overview: Primary Place of Performance   |
      | Overview: Application Overview           |
      | Overview: Project Information            |
      | Budget Tab: Budget Summary by Focus Area |
      | Budget: Budget Details                   |

  @507509 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist- SPI-  To verify Hide Logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                                                                     | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForApplicationSectionsForRevision__c | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I cannot see field "Application Sections for Revision" inside page block

  @507512 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist- SPI- To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I cannot see field label "Application Sections for Revision" inside page block
    When I enter "ApplicationSectionsForRevision" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Overview: Primary Place of Performance   |
      | Overview: Application Overview           |
      | Overview: Project Information            |
      | Budget Tab: Budget Summary by Focus Area |
      | Budget: Budget Details                   |

  @507514 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist-  SPI- To verify that Read only logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Recipient ApplicationView | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see field "ApplicationSectionsForRevision__c" is read-only field

  @508809 @multiselectpicklist
  Scenario: 3.0- Page Layout- multi-select picklist- SPI- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Recipient ApplicationView | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "ApplicationSectionsForRevision" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I see "Application Sections for Revision" on page "1" of "govgrants" pdf file

  @550038 @multiselectpicklist
  Scenario:3.0- Page Layout- Multi-Select picklist- SPI-Verify information section config for multi select picklist field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Skip for Export      | false             | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Skip for Export      | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "ApplicationSectionsForRevision" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Application Sections for Revision" on page "1" of "govgrants" pdf file

  @550038 @multiselectpicklist
  Scenario:3.0- Page Layout- Multi-Select picklist- SPI-Verify information section config for multi select picklist field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Skip for Export      | false             | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Skip for Export      | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "ApplicationSectionsForRevision" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Application Sections for Revision" on page "1" of "govgrants" pdf file

  @550044 @multiselectpicklist
  Scenario:3.0- Page Layout- Multi-Select picklist-config- SPI-Verify Required section config for multi select picklist field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Application Sections for Revision is required to save. Enter it in the Information section on the Overview tab. |

  @509095 @multiselectpicklist
  Scenario Outline: 3.0- Page Layout- multi-select picklist- Admin/PM- To verify Download as PDF after render in Config functioning correctly-
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:2 |
#      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
#      | Page Block Config:Page Block Rule Detail | Is Active            | false         | Grantor State Program | Name                      | {pagelayout:CreateProgramModalTypesOfType__C}                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Download as PDF" in the page details
    Then I see new tab is opened
    And I download the file
    And I pause execution for "5" seconds
    Then I see "Project Grants" on page "1" of "govgrants" pdf file
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @550036 @multiselectpicklist
  Scenario Outline:3.0- Page Layout- Multi-Select Picklist-Config- Admin/PM-Verify information section config for multi select picklist field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Skip For Export      | false             | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Skip For Export      | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Download as PDF" in the page details
    Then I see new tab is opened
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Project Grants" on page "1" of "govgrants" pdf file
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509096
  Scenario Outline: 3.0- Page Layout- multi-select picklist- Admin/PM- To verify Take Snapshot after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:2 |
#      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
#      | Page Block Config:Page Block Rule Detail | Is Active            | false         | Grantor State Program | Name                      | {pagelayout:CreateProgramModalTypesOfType__C}                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I enter "TypeOfAssistance MultiSelectPic" values from "AmendmentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "Project Grants" on page "1" of "govgrants" pdf file

    Examples:
      | Users |
     # | Admin |
      | PM    |

    ###############Test suite: 3.0 Forms - Multi-select picklist (Suite ID: 506165)

  @508379 @multiselectpicklist
  Scenario: 3.0- Forms- multi-select picklist- SPI- To verify that selecting Multiple option under Multi-Select Picklist
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    When I enter "Type of Applicant" values from "MultiSelectPicklist.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | A: State Government            |
      | B: County Government           |
      | C: City or Township Government |
      | D: Special District Government |
      | E: Regional Organization       |
    And I click on "Save" in the page details
    Then I softly see multiple selected options in "Type of Applicant":
      | A: State Government            |
      | B: County Government           |
      | C: City or Township Government |
      | D: Special District Government |
      | E: Regional Organization       |

  @508380 @508381 @multiselectpicklist
  Scenario:3.0- Forms- multi-select picklist- SPI- To verify Help Text on Hovering Help Text Icon Functioning correctly
  |3.0- Forms- multi-select picklist- SPI- To verify Field Label Override after render in Config|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                                 | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I see field "Field Label Override Automation" inside page block
    When I hovering mouse on help text icon inside "Field Label Override Automation"
    And I pause execution for "5" seconds
    Then I softly see "Automation" shown as help text

  @508387 @multiselectpicklist
  Scenario: 3.0- Forms- multi-select picklist- SPI- To verify that Field Label Override (Rich Text) is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                                 | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I see field "Type of Applicant" inside page block
    When I hovering mouse on help text icon inside "Field Label Override Automation"
    Then I softly see "Automation" shown as help text

  @508388 @multiselectpicklist
  Scenario: 3.0- Forms- multi-select picklist- SPI- To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Program Specific Application form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I cannot see field label "Type of Applicant" inside page block

  @508389 @multiselectpicklist
  Scenario: 3.0- Forms- multi-select picklist- SPI- To verify that read only is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Program Specific Application form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I see field "Type of Applicant" inside page block
    Then I softly see field "TypeOfApplicant__c" is read-only field

  @508789 @multiselectpicklist
  Scenario:3.0- Forms- multi-select picklist- SPI- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Program Specific Application form | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Program Specific Application form | Name                      | {SavedValue:TypeOfApplicant__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    When I enter "Type of Applicant" values from "MultiSelectPicklist.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | A: State Government            |
      | B: County Government           |
      | C: City or Township Government |
      | D: Special District Government |
      | E: Regional Organization       |
    And I click on "Save" in the page details
    Then I softly see multiple selected options in "Type of Applicant":
      | A: State Government            |
      | B: County Government           |
      | C: City or Township Government |
      | D: Special District Government |
      | E: Regional Organization       |
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "A: State Government" on page "1" of "govgrants" pdf file

  @506174 @multiselectpicklist
  Scenario:3.0- Forms- Multi-Select picklist- Admin/PM- To verify that selecting Multiple option under Multi-Select Picklist
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    And I get current URL
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    When I enter "TypeOfAssistance MultiSelectPic" values from "MultiSelectPicklist.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see multiple selected options in "Types Of Assistance":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |

  @506175 @506177 @506181 @multiselectpicklist
  Scenario:3.0- Forms- Multi-Select picklist- Admin/PM- To verify Help Text on Hovering Help Text Icon Functioning correctly
  |3.0- Forms- Multi-Select picklist- Admin/PM-To verify Field Label Override after render in Config|
  |3.0- Forms- Multi-Select picklist- Admin/PM- To verify that Field Label Override (Rich Text) is working after render on config|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                           | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                           | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    And I get current URL
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I see field "Field Label Override Automation" inside page block
    When I hovering mouse on help text icon inside "Field Label Override Automation"
    Then I softly see "Automation" shown as help text

  @506182 @multiselectpicklist
  Scenario:3.0- Forms- Multi-Select picklist- Admin/PM-To verify Hide Label is working after render on Config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                           | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    And I get current URL
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Types Of Assistance" inside page block

  @506184 @multiselectpicklist
  Scenario: 3.0- Forms- Multi-Select picklist- Admin/PM- To verify that Read only logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    And I get current URL
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "TypesOfAssistance__c" is read-only field

  @509098 @multiselectpicklist
  Scenario: 3.0- Forms- multi-select picklist- Admin/PM- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                            | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                           | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                           | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    And I get current URL
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    When I enter "TypeOfAssistance MultiSelectPic" values from "MultiSelectPicklist.xlsx"
    And I pause execution for "5" seconds
    Then I softly see multiple selected options in "Chosen":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see multiple selected options in "Types Of Assistance":
      | Project Grants                        |
      | Direct Payments with Unrestricted Use |
      | DIRECT LOANS                          |
      | DIRECT PAYMENTS FOR A SPECIFIED USE   |
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "Project Grant" on page "1" of "govgrants" pdf file

  @506179 @multiselectpicklist
  Scenario: 3.0- Forms- Multi-Select picklist- Admin/PM- To verify Hide Logic is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                    | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Field Label Override Automation                                         | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Automation                                                              | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                                                                   | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                                                                   | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:hideExpressionForGeneralReviewFormTypesOfAssistance__c | General Review Form | Name                      | {SavedValue:GeneralReviewFormTypesOfAssistance__c} |
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
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "7" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I cannot see field "Types Of Assistance" inside page block

  @507510 @multiselectpicklist
  Scenario: 3.0- Page Layout- Multi-Select picklist- SPI- To verify that Field Label Override (Rich Text) is working after render on config
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue   | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false               | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             | Types Of Assistance | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                     | Grantor Contact    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                          | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                               | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text Types Of Assistance | Grantor Contact    | Name                      | {SavedValue:CreateContactModalForSpi3TypesOfAssistance__c} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "5" seconds
    Then I see field "Rich Text Types Of Assistance" inside page block