@Sprint-2025 @SupportQueueHideLogic @US-541042
Feature: The user must create an SupportQueue Hide Logic t the LWC Object level.
  After creating the template, the user needs to specify the template name in the Action URL (Long) field within the LWC configuration.

  @547379
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Queue-In - GovGrantTest Queue -Test tab
    Then I softly do not see "Test Tab" subtab is present in page details

  @547379_1 @548693 @548695
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |  LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
  |LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Layout Action                  | Is Active            | true                                                             | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrantTest Queue - Test Block
    Then I do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    Then I do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547379_2 @547380 @548694
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |  LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:39 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block:Page Block Detail             | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    #Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block
    And I refresh the page
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    #Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

  @547380
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Queue-In - GovGrantTest Queue -Test tab
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @547382
  Scenario:LWC - Support queue - Form - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see the field "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" on forms
    Then I softly see the field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" on forms
    Then I softly see the field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    #Queue-In - GovGrantTest Queue -Test tab
    Then I softly do not see "Test Tab" subtab is present in page details

  @547382_1
  Scenario:LWC - Support queue - Form - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Layout Action                  | Is Active            | true                                                             | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see the field "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" on forms
    Then I softly see the field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" on forms
    Then I softly see the field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrantTest Queue - Test Block
    Then I do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    Then I do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547382_2
  Scenario:LWC - Support queue - Form - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:39 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block:Page Block Detail             | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                             | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIPAF | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see the field "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" on forms
    Then I softly see the field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" on forms
    Then I softly see the field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    Then I softly see the field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." on forms
    When I navigate to "Test Tab" sub tab
    And I pause execution for "2" seconds
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    #Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

  @547383
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Queue-In - InternationalLeads Queue -Test tab
    Then I softly see "Test Tab" subtab is present in page details

  @547383_1
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Layout Action                  | Is Active            | true                                                       | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Queue-In - InternationalLeads Queue - Test Block
    Then I softly see "Test Button" button is displayed
    Then I softly see "Test Block" page block displayed

  @547383_2
  Scenario: LWC - Support queue - Form - SPI - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:39 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block:Page Block Detail             | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIPAF | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    Then I softly see field "Acknowledgement" inside page block
    Then I softly see field "Agency Routing Identifier" inside page block
    Then I softly see field "Agreement1" inside page block
    Then I softly see field "Applicant Identifier" inside page block
    Then I softly see field "Applicant Review Date" inside page block
    #Then I softly see field "Application" inside page block
    Then I softly see field "Base Salary" inside page block
    Then I softly see field "CheckboxType" inside page block
    Then I softly see field "Citizenship" inside page block
    Then I softly see field "Email" inside page block
    Then I softly see field "Degree Year" inside page block
    Then I softly see field "Estimated Funding Applicant" inside page block
    Then I softly see field "Federal Share" inside page block
    Then I softly see field "Preapplication Title" inside page block
    Then I softly see field "Date And Time" inside page block
    Then I softly see field "Phone" inside page block
    Then I softly see field "Time" inside page block
    Then I softly see field "Website" inside page block

  @547370 @547371
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @547370_1 @547371 @548686 @548688
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Layout Action                  | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrants_Test Queue - Test Block
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547370_2 @547371 @548687
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}                             |
      | Page Block:Page Block Detail             | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}                           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Are any state specific forms attached?" inside page block
    Then I softly cannot see field "Address line 1" inside page block
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Funding Opportunity" inside page block
    Then I softly cannot see field "Additional Details" inside page block
    Then I softly cannot see field "Applicant Response" inside page block
    Then I softly cannot see field "Application Deadline" inside page block
    #Then I softly cannot see field "Application Due Date" inside page block
    Then I softly cannot see field "Authorized Representative Email" inside page block
    Then I softly cannot see field "Authorized Representative Phone" inside page block
    Then I softly cannot see field "Award Ceiling" inside page block
    Then I softly cannot see field "Budget Level" inside page block
    Then I softly cannot see field "Funding Agency Restriction" inside page block
    Then I softly cannot see field "URL" inside page block
    Then I softly cannot see field "X_Number Of Reviews" inside page block
    Then I softly cannot see field "Time" inside page block
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly cannot see field "Are any state specific forms attached?" inside page block
    Then I softly cannot see field "Address line 1" inside page block
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Funding Opportunity" inside page block
    Then I softly cannot see field "Additional Details" inside page block
    Then I softly cannot see field "Applicant Response" inside page block
    Then I softly cannot see field "Application Deadline" inside page block
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly cannot see field "Authorized Representative Email" inside page block
    Then I softly cannot see field "Authorized Representative Phone" inside page block
    Then I softly cannot see field "Award Ceiling" inside page block
    Then I softly cannot see field "Budget Level" inside page block
    Then I softly cannot see field "Funding Agency Restriction" inside page block
    Then I softly cannot see field "URL" inside page block
    Then I softly cannot see field "X_Number Of Reviews" inside page block
    Then I softly cannot see field "Time" inside page block

  @547372
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    Then I softly see the field "Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Program Income Allowed?" as "Yes" on forms
    Then I softly see the field "Match Required?" as "Yes" on forms
    Then I softly do not see "Test Tab" subtab is present in page details

  @547372_1
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Layout Action                  | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see the field "Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Program Income Allowed?" as "Yes" on forms
    Then I softly see the field "Match Required?" as "Yes" on forms
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrants_Test Queue - Test Block
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547372_2
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}                             |
      | Page Block:Page Block Detail             | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}                           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                          | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPI | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see the field "Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Program Income Allowed?" as "Yes" on forms
    Then I softly see the field "Match Required?" as "Yes" on forms
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Are any state specific forms attached?" inside page block
    Then I softly cannot see field "Address line 1" inside page block
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Funding Opportunity" inside page block
    Then I softly cannot see field "Additional Details" inside page block
    Then I softly cannot see field "Applicant Response" inside page block
    Then I softly cannot see field "Application Deadline" inside page block
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly cannot see field "Authorized Representative Email" inside page block
    Then I softly cannot see field "Authorized Representative Phone" inside page block
    Then I softly cannot see field "Award Ceiling" inside page block
    Then I softly cannot see field "Budget Level" inside page block
    Then I softly cannot see field "Funding Agency Restriction" inside page block
    Then I softly cannot see field "URL" inside page block
    Then I softly cannot see field "X_Number Of Reviews" inside page block
    Then I softly cannot see field "Time" inside page block

  @547373
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    Then I softly see "Test Tab" subtab is present in page details

  @547373_1
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}    |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}  |
      | Page Layout Action                  | Is Active            | true                                                    | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrants_Test Queue - Test Block
    Then I softly see "Test Button" button is displayed
    Then I softly see "Test Block" page block displayed

  @547373_2
  Scenario: LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:33 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:SPITestTab}                             |
      | Page Block:Page Block Detail             | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:SPITestBlock}                           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__cSPI} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:Addressline1__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:Acknowledgment2__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:Reasons1__c}                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:Announcement__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicantResponse__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDeadlineWithDateTime__cSPI}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:ApplicationDueDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativeEmail__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:AuthorizedRepresentativePhone__cSPI}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:AwardCeiling__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:BudgetLevel__c_Pick}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:FundingAgencyRestriction__c-Percent}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:URL__c_App}                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:NumberOfReviews__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                    | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI | Recipient ApplicationView | Name                      | {SavedValue:Time__c_App}                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Test Tab" sub tab
    Then I softly see field "Are any state specific forms attached?" inside page block
    Then I softly see field "Address line 1" inside page block
    Then I softly see field "Acknowledgement" inside page block
    Then I softly see field "Funding Opportunity" inside page block
    Then I softly see field "Additional Details" inside page block
    Then I softly see field "Applicant Response" inside page block
    Then I softly see field "Application Deadline" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Authorized Representative Email" inside page block
    Then I softly see field "Authorized Representative Phone" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Budget Level" inside page block
    Then I softly see field "Funding Agency Restriction" inside page block
    Then I softly see field "URL" inside page block
    Then I softly see field "X_Number Of Reviews" inside page block
    Then I softly see field "Time" inside page block

    ############ Modal - SPI #########
  @547374 @547376
  Scenario: LWC - Support queue - Modal - Tab -SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:ContactSPITestTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:ContactSPITestTab} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @547378
  Scenario: LWC - Support queue - Modal - SPI - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | Grantor Contact    | Name                      | {SavedValue:ContactSPITestTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPIContactModal | Grantor Contact    | Name                      | {SavedValue:ContactSPITestTab} |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly see "Test Tab" subtab is present in page details

  @548724 @548726 @547376
  Scenario: LWC - Support queue - Modal - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail        | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:ContactSPITestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:ContactSPITestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:ContactSPITestBlock} |
      | Page Layout Action                  | Is Active            | true                                                      | Grantor Contact    | Name                      | Test Button                      |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | Test Button                      |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @548725 @DataTypes @547376
  Scenario: LWC - Support queue - Modal - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - SPI - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:Title}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:Title}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:Salutation}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:Salutation}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:MobilePhone}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:MobilePhone}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:IsUser__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI   | Grantor Contact    | Name                      | {SavedValue:IsUser__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:MultiCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:MultiCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:RadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:RadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:OverAllRisk__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:OverAllRisk__c}       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Title" inside page block
    Then I softly cannot see field "Prefix" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Mobile" inside page block
    Then I softly cannot see field "Is User" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "OverAllRisk" inside page block
    And I refresh the page
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly cannot see field "Title" inside page block
    Then I softly cannot see field "Prefix" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Mobile" inside page block
    Then I softly cannot see field "Is User" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "OverAllRisk" inside page block

  @547377
  Scenario: LWC - Support queue - Modal - SPI - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:Title}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:Title}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:Salutation}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:Salutation}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:MobilePhone}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:MobilePhone}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:IsUser__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsSPI   | Grantor Contact    | Name                      | {SavedValue:IsUser__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:MultiCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:MultiCheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:RadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:RadioType__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | Grantor Contact    | Name                      | {SavedValue:OverAllRisk__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantSPIContactModal | Grantor Contact    | Name                      | {SavedValue:OverAllRisk__c}       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see the field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST" on forms
    Then I softly cannot see field "Title" inside page block
    Then I softly cannot see field "Prefix" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Mobile" inside page block
    Then I softly cannot see field "Is User" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "OverAllRisk" inside page block

    ##### Internal User ###################
  @547358 @548683 @548685
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
  |LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
  | LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Layout Action                  | Is Active            | true                                                | Grantor State Program | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | Test Button                    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547357
  Scenario:LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @548684 @547358
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Layout - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly cannot see field "Authorization" inside page block
    Then I softly cannot see field "X_Project Goals" inside page block
    Then I softly cannot see field "Abbreviation" inside page block
    Then I softly cannot see field "X_Funded Amount" inside page block
    Then I softly cannot see field "Focus Areas Required?" inside page block
    Then I softly cannot see field "Type" inside page block
    Then I softly cannot see field "CountNumber" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Project Period Start Date" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Authorized Signatory" inside page block
    And I refresh the page
    Then I softly cannot see field "Authorization" inside page block
    Then I softly cannot see field "X_Project Goals" inside page block
    Then I softly cannot see field "Abbreviation" inside page block
    Then I softly cannot see field "X_Funded Amount" inside page block
    Then I softly cannot see field "Focus Areas Required?" inside page block
    Then I softly cannot see field "Type" inside page block
    Then I softly cannot see field "CountNumber" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Project Period Start Date" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Authorized Signatory" inside page block


  @547359
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Layout Action                  | Is Active            | true                                                | Grantor State Program | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | Test Button                    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see the field "Type" as "Project Grants" on forms
    Then I softly see the field "Primary Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Created By" as "Automation PM" on forms
    And I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547359_1
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see the field "Type" as "Project Grants" on forms
    Then I softly see the field "Primary Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Created By" as "Automation PM" on forms
    Then I softly do not see "Test Tab" subtab is present in page details

  @547359_2
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsInternal | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see the field "Type" as "Project Grants" on forms
    Then I softly see the field "Primary Funding Organization" as "Test Automation Organization" on forms
    Then I softly see the field "Created By" as "Automation PM" on forms
    Then I softly cannot see field "Authorization" inside page block
    Then I softly cannot see field "X_Project Goals" inside page block
    Then I softly cannot see field "Abbreviation" inside page block
    Then I softly cannot see field "X_Funded Amount" inside page block
    Then I softly cannot see field "Focus Areas Required?" inside page block
    Then I softly cannot see field "Type" inside page block
    Then I softly cannot see field "CountNumber" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "Email Test" inside page block
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Project Period Start Date" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Authorized Signatory" inside page block

  @547360
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:InternalTestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestBlock} |
      | Page Layout Action                  | Is Active            | true                                                         | Grantor State Program | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | Test Button                    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Test Tab" sub tab
    Then I softly see "Test Button" button is displayed
    Then I softly see "Test Block" page block displayed

  @547360_1
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:InternalTestTab} |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see "Test Tab" subtab is present in page details

  @547360_2
  Scenario: LWC - Support queue - Layout - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:FocusAreaReq}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:CountNumber__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:AdminPmPageLayoutRadioType__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:Email_Test__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:Percent__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:StartDate__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsInternal | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}        |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Authorization" inside page block
    Then I softly see field "X_Project Goals" inside page block
    Then I softly see field "Abbreviation" inside page block
    Then I softly see field "X_Funded Amount" inside page block
    Then I softly see field "Focus Areas Required?" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "CountNumber" inside page block
    Then I softly see field "RadioType" inside page block
    Then I softly see field "Email Test" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Percent" inside page block
    Then I softly see field "Project Period Start Date" inside page block
    Then I softly see field "Time" inside page block
    Then I softly see field "Date And Time" inside page block
    Then I softly see field "Authorized Signatory" inside page block

  @548689 @548692 @547366
  Scenario:LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
  |LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Layout Action                  | Is Active            | true                                                   | General Review Form | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | Test Button                    |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Given I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547365 @547366
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @548690 @547366 @547367
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Form - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
  |LWC - Support queue - Form - PM - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:34 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see the field "Subrecipient Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST" on forms
    Then I softly see the field "Subrecipient POC" as "Automation SPI3" on forms
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "Fax Number:" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "First Name" inside page block
    Then I softly cannot see field "Funding Opportunity Title" inside page block
    Then I softly cannot see field "Question 1" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Acknowledgement1" inside page block
    Then I softly cannot see field "Last Name" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Disability Status" inside page block
    Then I softly cannot see field "Small Business" inside page block
    Then I softly cannot see field "Site Visit" inside page block
    Then I softly cannot see field "Config: Form" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Website" inside page block
    Then I softly cannot see field "LocationState" inside page block
    And I refresh the page
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "Fax Number:" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "First Name" inside page block
    Then I softly cannot see field "Funding Opportunity Title" inside page block
    Then I softly cannot see field "Question 1" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Acknowledgement1" inside page block
    Then I softly cannot see field "Last Name" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Disability Status" inside page block
    Then I softly cannot see field "Small Business" inside page block
    Then I softly cannot see field "Site Visit" inside page block
    Then I softly cannot see field "Config: Form" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Website" inside page block
    Then I softly cannot see field "LocationState" inside page block

  @547367
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Layout Action                  | Is Active            | true                                                   | General Review Form | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | Test Button                    |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I navigate to "Details" sub tab
    Then I softly see the field "Subrecipient Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST" on forms
    Then I softly see the field "Subrecipient POC" as "Automation SPI3" on forms
    Given I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @547367_1
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic works correctly also data remains consistent according to the queue value defined in the hide expression JSON
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsGAFInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see the field "Subrecipient Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST" on forms
    Then I softly see the field "Subrecipient POC" as "Automation SPI3" on forms
    Then I softly do not see "Test Tab" subtab is present in page details

  @547369
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see "Test Tab" subtab is present in page details

  @547369_1
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | true              | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Layout Action                  | Is Active            | true                                                            | General Review Form | Name                      | Test Button                    |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | Test Button                    |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I navigate to "Test Tab" sub tab
    Then I softly see "Test Button" button is displayed
    Then I softly see "Test Block" page block displayed

  @547369_3
  Scenario: LWC - Support queue - Form - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:34 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsGAFInternal | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
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
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Base Salary" inside page block
    Then I softly see field "Fax Number:" inside page block
    Then I softly see field "Federal Share" inside page block
    Then I softly see field "First Name" inside page block
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Question 1" inside page block
    Then I softly see field "Project Abstract" inside page block
    Then I softly see field "Acknowledgement1" inside page block
    Then I softly see field "Last Name" inside page block
    Then I softly see field "Citizenship" inside page block
    Then I softly see field "Disability Status" inside page block
    Then I softly see field "Small Business" inside page block
    Then I softly see field "Site Visit" inside page block
    Then I softly see field "Config: Form" inside page block
    Then I softly see field "Email" inside page block
    Then I softly see field "Website" inside page block
    Then I softly see field "LocationState" inside page block

  @547361 @547362
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON after refreshing the page|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}  |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}  |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    Then I softly do not see "Test Tab" subtab is present in page details
    And I refresh the page
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see "Test Tab" subtab is present in page details

  @548697 @548699
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail        | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
      | Page Layout Action                  | Is Active            | true                                                     | Grantor State Program Create | Name                      | Test Button                 |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | Test Button                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    And I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed
    And I refresh the page
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I navigate to "Test Tab" sub tab
    Then I softly do not see "Test Button" button is displayed
    Then I softly do not see "Test Block" page block displayed

  @548698 @547363
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - PM - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                            | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Abbrevation}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Abbrevation}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_InternalOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_InternalOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                     | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInGovGrantsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}        |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    Then I softly cannot see field "Abbrevation" inside page block
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Audits" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "Types Of Assistance" inside page block
    Then I softly cannot see field "Website Address" inside page block
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Published Date" inside page block
    Then I softly cannot see field "Test Description" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Email Test" inside page block
    And I refresh the page
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see field "Abbrevation" inside page block
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Audits" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "RadioType" inside page block
    Then I softly cannot see field "Types Of Assistance" inside page block
    Then I softly cannot see field "Website Address" inside page block
    Then I softly cannot see field "Phone Number" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Published Date" inside page block
    Then I softly cannot see field "Test Description" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Email Test" inside page block

  @547364
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic should not works correctly after defining invalid queue value in the hide expression JSON.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}  |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}  |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    Then I softly see "Test Tab" subtab is present in page details

  @547364_1
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:3 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail        | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:ModalTestTab}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:ModalTestBlock} |
      | Page Layout Action                  | Is Active            | true                                                              | Grantor State Program Create | Name                      | Test Button                 |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | Test Button                 |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    And I navigate to "Test Tab" sub tab
    Then I softly see "Test Button" button is displayed
    Then I softly see "Test Block" page block displayed

  @547364_2
  Scenario: LWC - Support queue - Modal - PM - Verify that hide logic works correctly according to the queue value defined in the hide expression JSON.
  |LWC - Support queue - Modal - PM - Verify that hide logic works correctly also data remain consistent according to the queue value defined in the hide expression JSON|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Abbrevation}          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Abbrevation}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_InternalOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_InternalOrganization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHidePBDQueueInInternationalLeadsModalInternal | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see the field "Internal Organization" as "Test Automation Organization" on forms
    Then I softly see field "Abbrevation" inside page block
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "CheckboxType" inside page block
    Then I softly see field "RadioType" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Percent" inside page block
    Then I softly see field "Published Date" inside page block
    Then I softly see field "Test Description" inside page block
    Then I softly see field "Time" inside page block
    Then I softly see field "Date And Time" inside page block
    Then I softly see field "Email Test" inside page block
