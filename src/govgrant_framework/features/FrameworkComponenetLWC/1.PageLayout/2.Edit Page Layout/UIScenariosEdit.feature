@PageLayout @UIscenarios @EditLayout @PageLayout2
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @362211 @362212
  Scenario Outline:Master TC- LWC-Flex Edit Layout- Save Action-Config -Admin- To verify, user should be able to see asterisk mark for required for save field if we provide config for 'Required Behavior'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {pagelayout:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {pagelayout:ProgramNameField} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I see asterisk mark at "Type" field in LWC

    Examples:
      | User |
      #| Admin |
      | PM   |

  @362214 @362215
  Scenario Outline: LWC-Flex Edit Layout- Save Action-Config -Admin- To verify, user should be able to see triangle symbols, for required for submit field if we provide config for 'Required Behavior' as 'required for submit'.
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    And I pause execution for "3" seconds
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    Then I see required for submit symbol at "Description" field

    Examples:
      | User |
      #| Admin |
      | PM   |

  @362219 @362222 @362225 @362226
  Scenario Outline:LWC-Flex Edit Layout- Save Action-Config -Admin- To verify, user should not be able to see asterisk mark for required for save field if we don't provide config for 'Required Behavior'.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I do not see asterisk mark at "Funded Amount" field in LWC
    Then I do not see required for submit symbol at "Funded Amount" field
    Examples:
      | User |
      #| Admin |
      | PM   |

  @362213
  Scenario: Master TC- LWC-Flex Edit Layout- Save Action-UI-SPI- To verify, user should be able to see asterisk mark for required for save field if we provide config for 'Required Behavior'.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "VA" into field "Addressline1__c"
    Then I see asterisk mark at "Address line 1" field in LWC

  @362217 @362227 @362224
  Scenario: LWC-Flex Edit Layout- Save Action-UI-SPI- To verify, user should be able to see triangle symbols, for required for submit field if we provide config for 'Required Behavior' as 'required for submit'.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "VA" into field "Addressline1__c"
        #362217
    Then I see required for submit symbol at "Project Abstract" field
        #362227
    Then I do not see required for submit symbol at "Budgeted Amount" field
        #362224
    Then I do not see asterisk mark at "Budgeted Amount" field in LWC
