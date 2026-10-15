@FormsComponentSanity @Forms2 @FormsStaticRecordsTest @@ComponentSanity2_1 @ComponentSanity2_1 @Forms

Feature: Component Sanity Forms1

  @pageblockdetailsTrue
  Scenario:Component Sanity SPI user satndard assurance forms pbd enabled Forms1
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFApplication__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |

  @falseConfig
  Scenario:Component Sanity SPI user satndard assurance forms pbd disabled Forms1
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFApplication__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |

  @549185 @549185_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Federal Share" inside page block
    Then I cannot see field label "Base Salary" inside page block
    Then I cannot see field label "Fax Number:" inside page block

  @549185 @549185_2
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Federal Share" inside page block
    Then I softly see field label "Base Salary" inside page block
    Then I softly see field label "Fax Number:" inside page block
    Then I softly see asterisk mark at "Federal Share" field in LWC
    Then I softly see asterisk mark at "Base Salary" field in LWC
    Then I softly see asterisk mark at "Fax Number:" field in LWC

  @549185 @549185_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "Federal Share" field
    Then I softly see required for submit symbol at "Base Salary" field
    Then I softly see required for submit symbol at "Fax Number:" field
    When I enter value "1000" into field "Base_Salary__c"
    When I enter value "333333" into field "User2FaxNumber__c"
    When I enter value "444444" into field "FederalShare__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Base Salary" as "$1,000.00"

  @549185 @549185_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Standard Assurances Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Base Salary   | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Fax Number:   | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Federal Share | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FLO Base Salary" inside page block
    Then I see field "FLO Fax Number:" inside page block
    Then I see field "FLO Federal Share" inside page block

  @549185 @549185_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Base_Salary__c" is not editable
    Then I see field "User2FaxNumber__c" is not editable
    Then I see field "FederalShare__c" is not editable

  @549185 @549185_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | Standard Assurances Form | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Base Salary   | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Fax Number:   | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Federal Share | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                        | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Rich Text FLO Base Salary" inside page block
    Then I see field "Rich Text FLO Fax Number:" inside page block
    Then I see field "Rich Text FLO Federal Share" inside page block

  @549185 @549185_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Standard Assurances Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Base_Salary__c" is not editable
    Then I see field "User2FaxNumber__c" is not editable
    Then I see field "FederalShare__c" is not editable

  @549185 @549185_7 @checkonlocalmachine
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName       | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active       | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active       | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active       | false             | Standard Assurances Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName       | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active       | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active       | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active       | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Base Salary" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Fax Number:" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Federal Share" on page "1" of "govgrants" pdf file

  @549185 @549185_8 @checkonlocalmachine
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active      | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active      | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active      | false             | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                      | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                      | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                      | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    When I hovering mouse on help text icon inside page block detail "Base Salary"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Fax Number:"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Federal Share"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Project Abstract"
    Then I softly see "Automation Help Text Long" shown as help text

  @549188 @549188_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Project Abstract" inside page block
    Then I cannot see field label "Question 1" inside page block
    Then I cannot see field label "Funding Opportunity Title" inside page block
    Then I cannot see field label "First Name" inside page block

  @549188 @549188_2
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Question 1" inside page block
    Then I softly see field label "Funding Opportunity Title" inside page block
    Then I softly see field label "First Name" inside page block
    Then I softly see field label "Project Abstract" inside page block
    Then I softly see asterisk mark at "Question 1" field in LWC
    Then I softly see asterisk mark at "Funding Opportunity Title" field in LWC
    Then I softly see asterisk mark at "First Name" field in LWC
    Then I softly see asterisk mark at "Project Abstract" field in LWC

  @549188 @549188_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "Question 1" field
    Then I softly see required for submit symbol at "Funding Opportunity Title" field
    Then I softly see required for submit symbol at "First Name" field
    Then I softly see required for submit symbol at "Project Abstract" field

#  @549188 @549188_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Funding Opportunity Title | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO First Name                | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Question 1                | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Project Abstract          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FLO Funding Opportunity Title" inside page block
    Then I see field "FLO First Name" inside page block
    Then I see field "FLO Question 1" inside page block
    Then I see field "FLO QProject Abstract" inside page block

  @549188 @549188_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId          |
      | Page Block Config:Page Block Rule Detail | Read Only         | false             | Standard Assurances Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Read Only         | false             | Standard Assurances Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Read Only         | false             | Standard Assurances Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Read Only         | false             | Standard Assurances Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FirstName__c" is not editable
    Then I see field "FundingOpportunityTitle__c" is not editable
    Then I see field "Question1__c" is not editable
    Then I see field "ProjectAbstract__c" is not editable

  @549188 @549188_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Funding Opportunity Title | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO First Name                | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Question 1                | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Project Abstract          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Rich Text FLO Funding Opportunity Title" inside page block
    Then I see field "Rich Text FLO First Name" inside page block
    Then I see field "Rich Text FLO Question 1" inside page block
    Then I see field "Rich Text FLO Project Abstract" inside page block

  @549188 @549188_6
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Question 1" inside page block
    Then I cannot see field label "Funding Opportunity Title" inside page block
    Then I cannot see field label "First Name" inside page block
    Then I cannot see field label "Project Abstract" inside page block

  @549188 @549188_7 @checkonlocalmachine
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName       | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName       | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Question 1" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Funding Opportunity Title" on page "1" of "govgrants" pdf file
    Then I softly cannot see "First Name" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Project Abstract" on page "1" of "govgrants" pdf file

  @549188 @549188_8 @checkonlocalmachine
  Scenario: LWC - Forms - SPI - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    When I hovering mouse on help text icon inside page block detail "Question 1"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Funding Opportunity Title"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "First Name"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Project Abstract"
    Then I softly see "Automation Help Text Long" shown as help text

  @549189
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read only logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only For User    |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only For Context |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement__c | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement__c | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement__c | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement__c | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only For User    | Applicant          | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only For Context | Edit               | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | IND                | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "FederalShare__c" is not editable
    Then I softly see field "Base_Salary__c" is not editable
    Then I softly see fields "User2FaxNumber__c" is in edit mode
    Then I softly see fields "FirstName__c" is in edit mode
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode
    Then I softly see fields "Question1__c" is in edit mode
    Then I softly see fields "ProjectAbstract__c" is in edit mode
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    When I enter value "Checked" into field "Acknowledgement__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Edit" in the page details
    Then I softly see field "FirstName__c" is not editable
    Then I softly see field "FundingOpportunityTitle__c" is not editable
    Then I softly see field "Question1__c" is not editable
    Then I softly see field "ProjectAbstract__c" is not editable

  @549190
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190NOTEQUALTO         | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190LESSTHANEQUALTO    | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190GREATERTHANEQUALTO | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190LESSTHAN           | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190GREATERTHAN        | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190EQUALTO            | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549190EQUALTO            | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    And I click modal button "Save"
    And I wait for "5" seconds
    And I click modal button "Edit"
    Then I softly see field "FirstName__c" is not editable
    Then I softly see field "FundingOpportunityTitle__c" is not editable
    Then I softly see field "Question1__c" is not editable
    Then I softly see field "ProjectAbstract__c" is not editable
    Then I softly see field "Base_Salary__c" is not editable
    Then I softly see field "FederalShare__c" is not editable
    Then I softly see field "LastName__c" is not editable

  @549191
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - $User
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549191DOLLARNOTEQUALTO | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549191DOLLAREQUALTO    | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |

  @549192
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - User Type
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549192USERTYPEEQUALTO       | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549192USERTYPENOTIN         | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549192USERTYPENOTININTERNAL | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly do not see fields "FundingOpportunityTitle__c" is in edit mode
    Then I softly see field "Question1__c" is not editable

  @549193
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - Profile
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549193USERPROFILE | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable

  @549194
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - Context
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549194CONTEXTINEDIT    | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549194CONTEXTNOTINEDIT | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly do not see fields "FundingOpportunityTitle__c" is in edit mode

  @549195
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - User App
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549195USERAPPIN    | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549195USERAPPNOTIN | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode

  @549351 @549351_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile          |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide for Context          |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide for User             |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile          | SPI           | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide for Context          | Edit          | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide for User             | Applicant     | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "FundingOpportunityTitle__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block

  @549351 @549351_2
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Standard Assurances Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Standard Assurances Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | Standard Assurances Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:SAF549351_1hide    | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:SAF549351_2blank   | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:SAF549351_2disable | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    When I enter value "test" into field "Question1__c"
    When I enter value "test" into field "FirstName__c"
    When I enter value "US Citizen" into field "Citizenship__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "First Name" as ""
    Then I softly see field "Question1__c" is not editable

  @549352
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549352DollarIn    | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549352DollarNotIn | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block

  @549357
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - User App
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549357Grantoras        | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549357GrantorasGrantee | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549357GrantorRecipient | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block

  @549358
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - User Type
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549358UsertypeInternal       | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549358UsertypeNotInreviewer  | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549358UsertypeInApplicant    | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549358UsertypeNotInApplicant | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block

  @549353
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549353FieldsEqualTo      | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549353LESSTHANEQUALTO    | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549353GREATERTHANEQUALTO | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549353LESSTHAN           | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549353GREATERTHAN        | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
#    Then I softly cannot see field "LastName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block
    Then I softly see field "ProjectAbstract__c" inside page block

  @549354
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Context
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549354_1 | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549354_2 | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549354_3 | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549354_4 | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block
    And I close the tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "LastName__c" inside page block
    Then I softly see field "Question1__c" inside page block

  @549355 @doubt
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549355_1 | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549355_2 | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly see field "LastName__c" inside page block

  @549356 @doubt
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
#    Then I softly cannot see field "LastName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block
    Then I softly cannot see field "ProjectAbstract__c" inside page block

  @549359
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549359_1 | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549359_2 | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block

  @549360
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549360_3group_1 | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "FirstName__c" inside page block


  @549361
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549361combination | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "LastName__c" inside page block

  @549465 @549465_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Email" inside page block
    Then I cannot see field label "Website" inside page block

  @549465 @549465_2
  Scenario: LWC - Forms - SPI - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Website" inside page block
    Then I softly see field label "Email" inside page block
    Then I softly see asterisk mark at "Website" field in LWC
    Then I softly see asterisk mark at "Email" field in LWC

  @549465 @549465_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "Website" field
    Then I softly see required for submit symbol at "Email" field

  @549465 @549465_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Standard Assurances Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Standard Assurances Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Standard Assurances Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Standard Assurances Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Standard Assurances Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Standard Assurances Form | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Website   | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Email     | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FLO Email" inside page block
    Then I see field "FLO Website" inside page block
    Then I see field "Website__c" is not editable
    Then I see field "Email__c" is not editable

  @549465 @549465_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Email   | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Website | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}   |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Rich Text FLO Email" inside page block
    Then I see field "Rich Text FLO Website" inside page block

  @549468 @549468_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Contact" inside page block

  @549468 @549468_2 @549468_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save   | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFApplication__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Contact" inside page block
    Then I softly see required for submit symbol at "Application" field

  @549468 @549468_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Contact   | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FLO Contact" inside page block
    Then I see field "Contact__c" is not editable

  @549468 @549468_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Standard Assurances Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Contact | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                  | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Rich Text FLO Contact" inside page block

  @549470 @549470_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Disability Status" inside page block

  @549470 @549470_2 @549470_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save   | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement SmallBusiness Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement SmallBusiness Intake}" in "---SmallBusinessReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement SmallBusiness Intake}" inside flex table with id "---SmallBusinessReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create SmallBusiness" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---SmallBusinessReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Disability Status" inside page block
    Then I softly see required for submit symbol at "Small Business" field

  @549470 @549470_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                       | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Disability Status | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                  | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                 | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "FLO Disability Status" inside page block
    Then I see field "Disability_Status__c" is not editable


  @549467 @549467_1
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Phone" inside page block
    Then I cannot see field label "Acknowledgement" inside page block
    Then I cannot see field label "Citizenship" inside page block
    Then I cannot see field label "Date Recieved By State" inside page block
    Then I cannot see field label "Date And Time" inside page block
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Hide Label | false         | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | false         | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Label | false         | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |

  @549467 @549467_2
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field label "Phone" inside page block
    Then I softly see field label "Acknowledgement" inside page block
    Then I softly see field label "Citizenship" inside page block
    Then I softly see field label "Date Recieved By State" inside page block
    Then I softly see field label "Date And Time" inside page block
    Then I softly see asterisk mark at "Phone" field in LWC
    Then I softly see asterisk mark at "Acknowledgement" field in LWC
    Then I softly see asterisk mark at "Citizenship" field in LWC
    Then I softly see asterisk mark at "Date Recieved By State" field in LWC
    Then I softly see asterisk mark at "Date And Time" field in LWC
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |


  @549467 @549467_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "Phone" field
    Then I softly see required for submit symbol at "Acknowledgement" field
    Then I softly see required for submit symbol at "Citizenship" field
    Then I softly see required for submit symbol at "Date Recieved By State" field
    Then I softly see required for submit symbol at "Date And Time" field
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |

  @549467 @549467_4
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Phone                  | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Acknowledgement        | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Citizenship            | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Date Recieved By State | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Date And Time          | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "FLO Phone" field
    Then I softly see required for submit symbol at "FLO Acknowledgement" field
    Then I softly see required for submit symbol at "FLO Citizenship" field
    Then I softly see required for submit symbol at "FLO Date Recieved By State" field
    Then I softly see required for submit symbol at "FLO Date And Time" field
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |

  @549467 @549467_5
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only | false             | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Read Only | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I see field "Phone__c" is not editable
    Then I see field "Acknowledgement__c" is not editable
    Then I see field "Citizenship__c" is not editable
    Then I see field "DateRecievedByState__c" is not editable
    Then I see field "Date_And_Time__c" is not editable
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false         | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |

  @549467 @549467_6
  Scenario: LWC - Forms - SPI - Page Block Details Config: Phone/Checkbox/Picklist/Date/DateTime/Reference Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Standard Assurances Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Phone                  | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Acknowledgement        | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Citizenship            | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Date Recieved By State | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Date And Time          | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see required for submit symbol at "Rich Text FLO Phone" field
    Then I softly see required for submit symbol at "Rich Text FLO Acknowledgement" field
    Then I softly see required for submit symbol at "Rich Text FLO Citizenship" field
    Then I softly see required for submit symbol at "Rich Text FLO Date Recieved By State" field
    Then I softly see required for submit symbol at "Rich Text FLO Date And Time" field
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}     |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFDateRecievedByState__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFDate_And_Time__c}       |

  @549351_3
  Scenario: LWC - Forms - SPI - Page Block Details Config: Verify Hide Logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549351QueeueIn                              | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextInEditSPIUser           | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeInApplicantSPIUser     | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePageTabProfileInSPIUser                 | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppInRecipientSPIUser        | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHideActionFor$UserFirstNameEqualsAutomation | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SAF549194CONTEXTNOTINEDIT                      | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly see field "LastName__c" inside page block
    Then I softly cannot see field "FundingOpportunityTitle__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block
    Then I softly cannot see field "ProjectAbstract__c" inside page block
    Then I softly cannot see field "Base_Salary__c" inside page block
    Then I softly cannot see field "FederalShare__c" inside page block

  @549196 @549356test
  Scenario: LWC - Forms - SPI - Page Block Details Config: Read Only Expression Builder - Queue
  |LWC - Forms - SPI - Page Block Details Config: Verify Hide Expression JSON - Queue|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | Standard Assurances Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549351QueeueIn    | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:SAF549351QueeueNotIn | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549351QueeueIn    | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:SAF549351QueeueNotIn | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly see field "FundingOpportunityTitle__c" inside page block
    Then I softly see field "Question1__c" is not editable
    Then I softly see fields "ProjectAbstract__c" is in edit mode
    
    
    ######################################

  @GeneralReviewFormPageBlockDetailsTrue
  Scenario: General Review Form Activate fields
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |


  @GeneralReviewFormPageBlockDetailsFalse @wip
  Scenario: General Review Form Deactive fields
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active | false         | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |

  @549535 @549535_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    Then I cannot see field label "Federal Share" inside page block
    Then I cannot see field label "Base Salary" inside page block
    Then I cannot see field label "Fax Number:" inside page block

  @549535 @549535_2
  Scenario: LWC - Forms - PM - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    Then I softly see field label "Federal Share" inside page block
    Then I softly see field label "Base Salary" inside page block
    Then I softly see field label "Fax Number:" inside page block
    Then I softly see asterisk mark at "Federal Share" field in LWC
    Then I softly see asterisk mark at "Base Salary" field in LWC
    Then I softly see asterisk mark at "Fax Number:" field in LWC

  @549535 @549535_3
  Scenario: LWC - Forms - PM - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    Then I softly see required for submit symbol at "Federal Share" field
    Then I softly see required for submit symbol at "Base Salary" field
    Then I softly see required for submit symbol at "Fax Number:" field
    When I enter value "1000" into field "Base_Salary__c"
    When I enter value "333333" into field "User2FaxNumber__c"
    When I enter value "444444" into field "FederalShare__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Base Salary" as "$1,000.00"

  @549535 @549535_4
  Scenario: LWC - Forms - PM - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Base Salary   | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Fax Number:   | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Federal Share | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only            | true              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only            | true              | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    Then I see field "FLO Base Salary" inside page block
    Then I see field "FLO Fax Number:" inside page block
    Then I see field "FLO Federal Share" inside page block
    Then I see field "Base_Salary__c" is not editable
    Then I see field "User2FaxNumber__c" is not editable
    Then I see field "FederalShare__c" is not editable

  @549535 @549535_5
  Scenario: LWC - Forms - PM - Page Block Details Config: Numeric Data Type Fields (Number, Currency & Percent)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                       | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                             | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Base Salary   | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Fax Number:   | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Federal Share | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                        | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                        | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                        | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    Then I see field "Rich Text FLO Base Salary" inside page block
    Then I see field "Rich Text FLO Fax Number:" inside page block
    Then I see field "Rich Text FLO Federal Share" inside page block

  @549535 @549535_7 @checkonlocalmachine
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName       | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName       | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Base Salary" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Fax Number:" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Federal Share" on page "1" of "govgrants" pdf file

  @549535 @549535_8 @checkonlocalmachine
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | false             | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
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
    When I click on "Save" in the page details
    When I hovering mouse on help text icon inside page block detail "Base Salary"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Fax Number:"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Federal Share"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Project Abstract"
    Then I softly see "Automation Help Text Long" shown as help text

  @549536 @549536_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
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
    Then I cannot see field label "Project Abstract" inside page block
    Then I cannot see field label "Question 1" inside page block
    Then I cannot see field label "Funding Opportunity Title" inside page block

  @549536 @549536_2
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    Then I softly see field label "First Name" inside page block
    Then I softly see field label "Funding Opportunity Title" inside page block
    Then I softly see field label "Question 1" inside page block
    Then I softly see field label "Project Abstract" inside page block
    Then I softly see asterisk mark at "Question 1" field in LWC
    Then I softly see asterisk mark at "Funding Opportunity Title" field in LWC
    Then I softly see asterisk mark at "First Name" field in LWC
    Then I softly see asterisk mark at "Project Abstract" field in LWC

  @549536 @549536_3
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    Then I softly see required for submit symbol at "Question 1" field
    Then I softly see required for submit symbol at "Funding Opportunity Title" field
    Then I softly see required for submit symbol at "First Name" field
    Then I softly see required for submit symbol at "Project Abstract" field

  @549536 @549536_4
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                         | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                               | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Funding Opportunity Title | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO First Name                | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Question 1                | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO QProject Abstract         | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    Then I see field "FLO Funding Opportunity Title" inside page block
    Then I see field "FLO First Name" inside page block
    Then I see field "FLO Question 1" inside page block
    Then I see field "FLO QProject Abstract" inside page block
    Then I see field "FirstName__c" is not editable
    Then I see field "FundingOpportunityTitle__c" is not editable
    Then I see field "Question1__c" is not editable
    Then I see field "ProjectAbstract__c" is not editable

  @549536 @549536_5
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                                         | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Funding Opportunity Title | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO First Name                | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Question 1                | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Project Abstract          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    Then I see field "Rich Text FLO Funding Opportunity Title" inside page block
    Then I see field "Rich Text FLO First Name" inside page block
    Then I see field "Rich Text FLO Question 1" inside page block
    Then I see field "Rich Text FLO Project Abstract" inside page block

  @549536 @549536_6
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    Then I cannot see field label "Question 1" inside page block
    Then I cannot see field label "Funding Opportunity Title" inside page block
    Then I cannot see field label "Project Abstract" inside page block

  @549536 @549536_7 @checkonlocalmachine
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName       | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | false             | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName       | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Skip For Export | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    When I click on "Save" in the page details
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I softly cannot see "Question 1" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Funding Opportunity Title" on page "1" of "govgrants" pdf file
    Then I softly cannot see "First Name" on page "1" of "govgrants" pdf file
    Then I softly cannot see "Project Abstract" on page "1" of "govgrants" pdf file

  @549536 @549536_8 @checkonlocalmachine
  Scenario: LWC - Forms - PM - Page Block Details Config: Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long |                   | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Help Text Long | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
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
    When I click on "Save" in the page details
    When I hovering mouse on help text icon inside page block detail "Question 1"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Funding Opportunity Title"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "First Name"
    Then I softly see "Automation Help Text Long" shown as help text
    When I hovering mouse on help text icon inside page block detail "Project Abstract"
    Then I softly see "Automation Help Text Long" shown as help text

  @549537
  Scenario: LWC - Forms - PM - Page Block Details Config: Read only logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only For User    |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only For Context |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement1__c | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement1__c | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement1__c | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Decision Field   | Acknowledgement1__c | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only For User    | Applicant           | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only For Context | Edit                | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | IND                 | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
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
    And I pause execution for "3" seconds
    Then I softly see field "FederalShare__c" is not editable
    Then I softly see fields "Base_Salary__c" is in edit mode
    Then I softly see fields "User2FaxNumber__c" is in edit mode
    Then I softly see fields "FirstName__c" is in edit mode
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode
    Then I softly see fields "Question1__c" is in edit mode
    Then I softly see fields "ProjectAbstract__c" is in edit mode
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    When I enter value "Checked" into field "Acknowledgement1__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Edit" in the page details
    Then I softly see field "FirstName__c" is not editable
    Then I softly see field "FundingOpportunityTitle__c" is not editable
    Then I softly see field "Question1__c" is not editable
    Then I softly see field "ProjectAbstract__c" is not editable

  @549538
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190NOTEQUALTO         | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190LESSTHANEQUALTO    | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190GREATERTHANEQUALTO | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190LESSTHAN           | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190GREATERTHAN        | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190EQUALTO            | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549190EQUALTO            | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I wait for "3" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    And I click modal button "Save"
    And I wait for "5" seconds
    And I click modal button "Edit"
    Then I softly see field "FirstName__c" is not editable
    Then I softly see field "FundingOpportunityTitle__c" is not editable
    Then I softly see field "Question1__c" is not editable
    Then I softly see field "ProjectAbstract__c" is not editable
    Then I softly see field "Base_Salary__c" is not editable
    Then I softly see field "FederalShare__c" is not editable
    Then I softly see field "LastName__c" is not editable

  @549539
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - $User
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549191DOLLARNOTEQUALTO | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549191DOLLAREQUALTO    | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "5" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |

  @549541
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - User Type
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549192USERTYPEEQUALTO       | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549192USERTYPENOTIN         | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549192USERTYPENOTININTERNAL | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                 | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly do not see fields "FundingOpportunityTitle__c" is in edit mode
    Then I softly see field "Question1__c" is not editable

  @549542
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - Profile
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549193USERPROFILE | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable

  @549543
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - Context
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549194CONTEXTINEDIT    | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549194CONTEXTNOTINEDIT | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode

  @549544
  Scenario: LWC - Forms - PM - Page Block Details Config: Read Only Expression Builder - User App
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549195USERAPPIN    | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:GRF549195USERAPPNOTIN | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly see field "FirstName__c" is not editable
    Then I softly see fields "FundingOpportunityTitle__c" is in edit mode

  @549562 @549562_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide For Profile          |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide for Context          |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide for User             |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile          | SPI           | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide for Context          | Edit          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide for User             | Applicant     | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
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
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "FundingOpportunityTitle__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block

  @549562 @549562_2 @wip
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Logic
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:GRF549351_1hide    | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:GRF549351_2blank   | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          | govgrants_config:GRF549351_2disable | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I wait for "3" seconds
    When I enter value "test" into field "Question1__c"
    When I enter value "test" into field "FirstName__c"
    When I enter value "US Citizen" into field "Citizenship__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "First Name" as ""
    Then I softly see field "Question1__c" is not editable

  @549561
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:GRF549352DollarIn    | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:GRF549352DollarNotIn | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                       | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block

  @549556
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - User App
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:GRF549357Grantoras        | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:GRF549357GrantorasGrantee | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:GRF549357GrantorRecipient | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                            | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                            | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I wait for "3" seconds
    Then I softly see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block

  @549555
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - User Type
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549358UsertypeInternal       | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549358UsertypeNotInreviewer  | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549358UsertypeInApplicant    | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549358UsertypeNotInApplicant | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                                  | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I pause execution for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block

  @549560
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549353FieldsEqualTo      | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549353LESSTHANEQUALTO    | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549353GREATERTHANEQUALTO | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549353LESSTHAN           | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549353GREATERTHAN        | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                              | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I pause execution for "3" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block
    Then I softly see field "ProjectAbstract__c" inside page block

  @549559
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Context
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549354_1 | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549354_2 | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549354_3 | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549354_4 | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly cannot see field "LastName__c" inside page block
    Then I softly see field "Question1__c" inside page block

  @549558 @doubt
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549355_1 | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549355_2 | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly cannot see field "FirstName__c" inside page block
    Then I softly see field "LastName__c" inside page block

  @549356 @doubt
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config: | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I pause execution for "3" seconds
    When I enter value "1111" into field "User2FaxNumber__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly cannot see field "FirstName__c" inside page block
#    Then I softly cannot see field "LastName__c" inside page block
    Then I softly cannot see field "Question1__c" inside page block
    Then I softly cannot see field "ProjectAbstract__c" inside page block

  @549554
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549359_1 | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549359_2 | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                              | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see field "FirstName__c" inside page block
    Then I softly see field "LastName__c" inside page block

  @549553
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549360_3group_1 | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                     | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "FirstName__c" inside page block

  @549552
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:GRF549361combination | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                       | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "4" seconds
    Then I softly cannot see field "LastName__c" inside page block

  @549551 @549551_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
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
    Then I cannot see field label "Email" inside page block
    Then I cannot see field label "Website" inside page block

  @549551 @549551_2
  Scenario: LWC - Forms - PM - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
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
    Then I softly see field label "Website" inside page block
    Then I softly see field label "Email" inside page block
    Then I softly see asterisk mark at "Website" field in LWC
    Then I softly see asterisk mark at "Email" field in LWC

  @549551 @549551_3
  Scenario: LWC - Forms - PM - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
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
    Then I softly see required for submit symbol at "Website" field
    Then I softly see required for submit symbol at "Email" field

  @549551 @549551_4
  Scenario: LWC - Forms - PM - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Website   | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Email     | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
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
    Then I see field "FLO Email" inside page block
    Then I see field "FLO Website" inside page block
    Then I see field "Website__c" is not editable
    Then I see field "Email__c" is not editable

  @549551 @549551_5
  Scenario: LWC - Forms - PM - Page Block Details Config: Email/URL Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Email   | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Website | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | General Review Form | Name                      | {SavedValue:EXEWebsite__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | General Review Form | Name                      | {SavedValue:EXEEmail__c}   |
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
    Then I see field "Rich Text FLO Email" inside page block
    Then I see field "Rich Text FLO Website" inside page block

  @549468 @549468_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Config: Form" inside page block

  @549468 @549468_2 @549468_3
  Scenario: LWC - Forms - PM - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save   | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:Application__c}   |
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
    Then I softly see field label "Config: Form" inside page block
    Then I softly see required for submit symbol at "Application" field

  @549468 @549468_4
  Scenario: LWC - Forms - PM - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Contact   | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false         | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
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
    Then I see field "FLO Config" inside page block
    Then I see field "ConfigForm__c" is not editable

  @549468 @549468_5
  Scenario: LWC - Forms - PM - Page Block Details Config: Lookup Data Type Fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only                        | false             | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                       | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) | Rich Text FLO Contact | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Read Only                        | true                  | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                 | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
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
    Then I see field "Rich Text FLO Contact" inside page block

  @549470 @549470_1
  Scenario: LWC - Forms - PM - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName  | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label | false             | General Review Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName  | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide Label | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I cannot see field label "Disability Status" inside page block

  @549470 @549470_2 @549470_3
  Scenario: LWC - Forms - PM - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false               | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}     |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see field label "Disability Status" inside page block
    Then I softly see required for submit symbol at "Small Business" field

  @549470 @549470_4
  Scenario: LWC - Forms - PM - Page Block Details Config: Multi-select Picklist Data Type Field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false             | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                       | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO Disability Status | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                  | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label           | false                 | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
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
    Then I see field "FLO Disability Status" inside page block
    Then I see field "Disability_Status__c" is not editable

  @549557
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHideActionForQueueInGovGrantTestQueueInternalUser       | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHidePageBlockForQueueNotInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHideActionForQueueInGovGrantTestQueueInternalUser       | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
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
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block


  @549557test
  Scenario: LWC - Forms - PM - Page Block Details Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:8 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | General Review Form | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHideActionForQueueInGovGrantTestQueueInternalUser       | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHidePageBlockForQueueNotInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEJHideActionForQueueInGovGrantTestQueueInternalUser       | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXECitizenship__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXEFirstName__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON          |                                                                             | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                                                             | General Review Form | Name                      | {SavedValue:EXELastName__c}        |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see field "Citizenship__c" inside page block
    Then I softly see field "FirstName__c" inside page block
    Then I softly cannot see field "LastName__c" inside page block