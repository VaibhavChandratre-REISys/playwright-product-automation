@PageLayout @UIscenarios @ViewLayout @PageLayout1
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @362113 @362154
  Scenario Outline: LWC-Flex View Layout - Fields - Config- Admin- To verify that the field is required to save record when required behavior is set to 'Required for Save' in Required config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | PBD-35403                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | PBD-35403                  |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #362113
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    Then I see asterisk mark at "Type" field in LWC
    And I clear the value from field "ProgramName__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Overview tab under the Information section. |

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @362155
  Scenario: LWC-Flex View Layout- Save Action-UI -SPI - To verify, user should be able to see asterisk mark for required for save field if we provide config for 'Required Behavior.'
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
    When I click on "Save" in the page details
    Then I see asterisk mark at "Address line 1" field in LWC
    When I click on "Edit" in the page details
    And I clear the value from field "Addressline1__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Address line 1 is required to save under Overview. |

  @362157 @362158
  Scenario Outline:LWC-Flex View Layout- Save Action-Config -Admin- To verify, user should be able to see triangle symbols, for required for submit field if we provide config for 'Required Behavior' as 'required for submit'.
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---lwcprogram:-:programsTableId---"
    And I pause execution for "3" seconds
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I see required for submit symbol at "Description" field
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I navigate to "Overview" sub tab
    And I clear the value from field "Objectives__c"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Description is required in the Overview tab under the Description section. |

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @362205 @362206 @362208 @362209
  Scenario Outline: LWC-Flex View Layout- Save Action-Config -Admin- To verify, user should not be able to see asterisk mark for required for save field if we don't provide config for 'Required Behavior'.
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
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I do not see asterisk mark at "Funded Amount" field in LWC
    Then I do not see required for submit symbol at "Funded Amount" field
    Examples:
      | User |
   #   | Admin |
      | PM   |

  @362160 @362207 @382228
  Scenario: LWC-Flex View Layout- Save Action-UI -SPI- To verify, user should be able to see triangle symbols, for required for submit field if we provide config for 'Required Behavior' as 'required for submit'.
  LWC-Flex View Layout- Save Action-UI -SPI - To verify, user should not be able to see asterisk mark for required for save field if we don't provide config for 'Required Behavior'.
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
    When I click on "Save" in the page details
      #362160
    Then I see required for submit symbol at "Project Abstract" field
      #362207
    Then I do not see required for submit symbol at "Budgeted Amount" field
    Then I do not see asterisk mark at "Budgeted Amount" field in LWC
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    #And I navigate to "Form" sub tab in split screen
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
#    To Do:- Button is not display hence commented also added below step for now
#    And I click on "Back" in the page details
    And I navigate to "Form" sub tab in split screen
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
#    To Do:- Button is not display hence commented also added below step for now
#    And I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I clear the value from field "Addressline1__c"
    When I click on "Save" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Address line 1 is required to save under Overview. |

