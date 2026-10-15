@ComponentSanity @AlternateRendering @ComponentSanity1
Feature: Component Sanity Testing AlternateRendering
  In this feature file, we use the following tags for component-wise execution:@AlternateRendering

  @506269 @AlternateRendering
  Scenario Outline:3.0- Modal- Alternate Rendering- Admin/PM- To Verify Checkbox Enable and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @506270 @AlternateRendering
  Scenario Outline: 3.0- Modal- Alternate Rendering- Admin/PM- To Verify Radio button Select and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program        | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue            | coreComponentField           | coreComponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I enter value "Display 1" into field "TypesOfAssistance__c"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Display 1" as "Checked"

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @508679 @AlternateRendering
  Scenario: 3.0- Modal- Alternate Rendering- SPI- To Verify Checkbox Enable and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor Contact    | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor Contact    | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor Contact    | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor Contact    | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor Contact    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"

  @508682 @AlternateRendering
  Scenario: 3.0- Modal- Alternate Rendering- SPI- To Verify Radio button Select and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor Contact    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor Contact    | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor Contact    | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor Contact    | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor Contact    | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor Contact    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor Contact    | Name                      | {SavedValue:SpiUserModalRadioType__c}    |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    And I enter value "Display 1" into field "RadioType__c"
    Then I softly see field "Display 1" as "Checked"
    Then I softly see field "Display 2" as "Unchecked"


  @504619 @AlternateRendering
  Scenario Outline: 3.0- Page Layout- Alternate Rendering- Admin/PM- To Verify Checkbox Enable and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor State Program Create | Name                      | {SavedValue:AdminPmModalRadioType__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c}               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    Then I select below checkbox options for field "TypesOfAssistance__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    And I click modal button "Continue"
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    Examples:
      | Users |
#      | Admin |
      | PM    |

  @504620 @AlternateRendering
  Scenario Outline: 3.0- Page Layout- Alternate Rendering- Admin/PM- To Verify Radio button Select and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program        | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program        | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue            | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Grantor State Program Create | Name                      | {SavedValue:AdminPmModalRadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Grantor State Program Create | Name                      | {SavedValue:AdminPmModalRadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Grantor State Program Create | Name                      | {SavedValue:AdminPmModalRadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                    | Grantor State Program Create | Name                      | {SavedValue:AdminPmUserModalCheckboxType__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                    | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutCheckboxType__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "Display 1" into field "RadioType__c"
    And I click modal button "Save and Continue"
    Then I softly see field "Display 1" as "Checked"
    Then I softly see field "Display 2" as "Unchecked"
    Then I softly see field "Display 3" as "Unchecked"
    Then I softly see field "Display 4" as "Unchecked"

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @508613 @AlternateRendering
  Scenario:3.0- Page Layout- Alternate Rendering- SPI- To Verify Checkbox Enable and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Recipient Pre-Application     | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Recipient Pre-Application     | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Recipient Pre-Application     | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "5" seconds
    And I click on "Create Pre-Application" in the page details
    Then I select below checkbox options for field "INDIRECTBudgetCategories__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    When I click modal button "Save and Continue"
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"

  @508620 @AlternateRendering @bug-551422
  Scenario: 3.0- Page Layout- Alternate Rendering- SPI- To Verify Radio button Select and Save Functionality, Display Values on UI
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Recipient Pre-Application     | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Recipient Pre-Application     | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Recipient Pre-Application     | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue            | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I enter value "Display 1" into field "INDIRECTBudgetCategories__c"
    And I click on "Save" in the page details
    Then I softly see field "Display 1" as "Checked"
    Then I softly see field "Display 2" as "Unchecked"
    Then I softly see field "Display 3" as "Unchecked"
    Then I softly see field "Display 4" as "Unchecked"

  @508826 @AlternateRendering @bug-551422
  Scenario: 3.0- Page Layout- Alternate Rendering- SPI- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Recipient Pre-Application     | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Recipient Pre-Application     | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Recipient Pre-Application     | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue            | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I enter value "Display 1" into field "INDIRECTBudgetCategories__c"
    And I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I pause execution for "5" seconds
    And I download the file
    And I pause execution for "5" seconds
    Then I softly see "Display 1" on page "1" of "govgrants" pdf file

  @508830 @AlternateRendering @bug-551422
  Scenario: 3.0- Page Layout- Alternate Rendering- SPI- To verify Take Snapshot after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Create Grantor Preapplication | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Create Grantor Preapplication | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Create Grantor Preapplication | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Recipient Pre-Application     | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Recipient Pre-Application     | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Recipient Pre-Application     | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue            | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                     | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                    | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I wait for "7" seconds
    And I enter value "Display 1" into field "INDIRECTBudgetCategories__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    And I click modal button "Continue"
    Then I softly see field "Display 1" as "Checked"
    When I click on "Take Snapshot" in the page details
    Then I see the following message in the page details contains:
      | SnapShot created successfully. Please refresh the page. Please click here to download. |

  @509108 @AlternateRendering
  Scenario Outline: :3.0- Page Layout- Alternate Rendering- Admin/PM- To verify Take Snapshot after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Grantor State Program Create | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Grantor State Program Create | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Grantor State Program        | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program Create | Name                      | {SavedValue:AdminPmUserModalCheckboxType__c}             |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program Create | Name                      | {SavedValue:AdminPmUserModalCheckboxType__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program Create | Name                      | {SavedValue:AdminPmUserModalCheckboxType__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutCheckboxType__c}            |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutCheckboxType__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutCheckboxType__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor State Program        | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                      | Grantor State Program        | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I click on "Cancel" in the page details without processing
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed
    And I click "Continue" on modal confirmation box
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    When I click on "Take Snapshot" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    And I wait for "2" seconds
    Then I softly see snapshot with name containing "SnapShot on" as name

    Examples:
      | Users |
#      | Admin |
      | PM    |

    ######3.0 Forms - Alternate Rendering (Suite ID: 506197)


  @506208 @506210 @AlternateRendering
  Scenario: 3.0- Forms- Alternate Rendering- Admin/PM- To Verify Checkbox Enable and Save Functionality, Display Values on UI
  |3.0- Forms- Alternate Rendering- Admin/PM- To Verify Radio button Select and Save Functionality, Display Values on UI|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                           |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
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
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    Then I softly see field "Display 1" as "Checked"

  @509109 @AlternateRendering
  Scenario: 3.0- Forms- Alternate Rendering- Admin/PM- To verify Take Snapshot after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                           |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
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
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Take Snapshot" in the page details
    Then I see the following message in the page details contains:
      | SnapShot created successfully. Please refresh the page. Please click here to download. |

  @509110 @AlternateRendering
  Scenario: 3.0- Forms- Alternate Rendering- Admin/PM- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | General Review Form | ApiGeneratedId:5 |
      | Page Layout                              | Hide On Demand Snaphot       | false             | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                           |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | General Review Form | Name                      | {SavedValue:GeneralReviewFormExeUserRadioType__c}    |
      | Page Layout:General                      | Hide On Demand Snaphot       | false                      | General Review Form |                           |                                                      |
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Take Snapshot" in the page details
    Then I see the following message in the page details contains:
      | SnapShot created successfully. Please refresh the page. Please click here to download. |


  @508489 @508498 @AlternateRendering @bug-551422
  Scenario:3.0- Forms- multi-select picklist- SPI- To verify Download as PDF after render in Config functioning correctly
  |3.0- Forms- Alternate Rendering- SPI- To Verify Radio button Select and Save Functionality, Display Values on UI|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
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
    When I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I click on "Save" in the page details
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    Then I softly see field "Display 1" as "Checked"
    And I click on "Edit" in the page details
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
    And I click on "Cancel" in the page details without processing
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed
    And I click "Continue" on modal confirmation box
    Then I softly see field "Display Value on UI 1" as "Checked"
    Then I softly see field "Display Value on UI 2" as "Checked"
    Then I softly see field "Display Value on UI 3" as "Checked"
    Then I softly see field "Display Value on UI 4" as "Checked"
    Then I softly see field "Display 1" as "Checked"
    And I click on "Edit" in the page details
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    Then I softly see field "Display Value on UI 1" as "Unchecked"
    Then I softly see field "Display Value on UI 2" as "Unchecked"
    Then I softly see field "Display Value on UI 3" as "Unchecked"
    Then I softly see field "Display Value on UI 4" as "Unchecked"

  @508833 @AlternateRendering @bug-551422
  Scenario: 3.0- Forms- Alternate Rendering- SPI- To verify Download as PDF after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
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
    When I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened
    And I pause execution for "5" seconds
    And I download the file
    And I pause execution for "5" seconds
    Then I see "Display Value on UI 1" on page "1" of "govgrants" pdf file

  @508835 @AlternateRendering @bug-551422
  Scenario: 3.0- Forms- Alternate Rendering- SPI- To verify Take Snapshot after render in Config functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | coreComponentField                | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false             | Program Specific Application form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | Program Specific Application form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | Program Specific Application form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                                        |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRadioButton   | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:ProgramSpecificApplicationformSPIUserRadioType__c}    |
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
    When I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I select below checkbox options for field "CheckboxType__c"
      | Display Value on UI 1 |
      | Display Value on UI 2 |
      | Display Value on UI 3 |
      | Display Value on UI 4 |
    And I enter value "Display 1" into field "RadioType__c"
    And I click on "Save" in the page details
    When I click on "Take Snapshot" in the page details
    Then I see the following message in the page details contains:
      | SnapShot created successfully. Please refresh the page. Please click here to download. |
